import nimcrypto/hash, nimcrypto/sha2, nimcrypto/utils

when isMainModule:
  const
    code224 = [
      "abc",
      "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
    ]
    code256 = [
      "abc",
      "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
    ]
    code384 = [
      "abc",
      """abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn
         hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"""
    ]
    code512 = [
      "abc",
      """abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn
         hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"""
    ]
    code512_224 = [
      "abc",
      """abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn
         hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"""
    ]
    code512_256 = [
      "abc",
      """abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn
         hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"""
    ]
    digest224 = [
      "23097D223405D8228642A477BDA255B32AADBCE4BDA0B3F7E36C9DA7",
      "75388B16512776CC5DBA5DA1FD890150B0C6455CB4F58B1952522525",
    ]
    digest256 = [
      "BA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD",
      "248D6A61D20638B8E5C026930C3E6039A33CE45964FF2167F6ECEDD419DB06C1"
    ]
    digest384 = [
      """CB00753F45A35E8BB5A03D699AC65007272C32AB0EDED163
         1A8B605A43FF5BED8086072BA1E7CC2358BAECA134C825A7""",
      """09330C33F71147E83D192FC782CD1B4753111B173B3B05D2
         2FA08086E3B0F712FCC7C71A557E2DB966C3E9FA91746039"""
    ]
    digest512 = [
      """DDAF35A193617ABACC417349AE20413112E6FA4E89A97EA20A9EEEE64B55D39A
         2192992A274FC1A836BA3C23A3FEEBBD454D4423643CE80E2A9AC94FA54CA49F""",
      """8E959B75DAE313DA8CF4F72814FC143F8F7779C6EB9F7FA17299AEADB6889018
         501D289E4900F7E4331B99DEC4B5433AC7D329EEB6DD26545E96E55B874BE909"""
    ]
    digest512_224 = [
      "4634270F707B6A54DAAE7530460842E20E37ED265CEEE9A43E8924AA",
      "23FEC5BB94D60B23308192640B0C453335D664734FE40E7268674AF9"
    ]
    digest512_256 = [
      "53048E2681941EF99B2E29B76B4C7DABE4C2D0C634FC6D46E0E2F13107E7AF23",
      "3928E184FB8690F840DA3988121D31BE65CB9D3EF83EE6146FEAC861E19B563A"
    ]

  var ctx224 = sha224()
  var ctx256 = sha256()
  var ctx384 = sha384()
  var ctx512 = sha512()
  var ctx512224 = sha512_224()
  var ctx512256 = sha512_256()
  var i = 0

  # SHA 224
  i = 0
  while i < len(code224):
    var plaintext = stripSpaces(code224[i])
    var digest = stripSpaces(digest224[i])
    init(ctx224)
    ctx224.update(cast[ptr uint8](addr plaintext[0]), uint(len(plaintext)))
    var check1 = $ctx224.finish()
    var check2 = $sha224.digest(cast[ptr uint8](addr plaintext[0]),
                                uint(len(plaintext)))
    var check3 = $sha224.digest(plaintext)
    doAssert(check1 == digest and check2 == digest and check3 == digest)
    inc(i)

  # SHA 256
  i = 0
  while i < len(code256):
    var plaintext = stripSpaces(code256[i])
    var digest = stripSpaces(digest256[i])
    init(ctx256)
    ctx256.update(cast[ptr uint8](addr plaintext[0]), uint(len(plaintext)))
    var check1 = $ctx256.finish()
    var check2 = $sha256.digest(cast[ptr uint8](addr plaintext[0]),
                                uint(len(plaintext)))
    var check3 = $sha256.digest(plaintext)
    doAssert(check1 == digest and check2 == digest and check3 == digest)
    inc(i)

  # SHA 384
  i = 0
  while i < len(code384):
    var plaintext = stripSpaces(code384[i])
    var digest = stripSpaces(digest384[i])
    init(ctx384)
    ctx384.update(cast[ptr uint8](addr plaintext[0]), uint(len(plaintext)))
    var check1 = $ctx384.finish()
    var check2 = $sha384.digest(cast[ptr uint8](addr plaintext[0]),
                                uint(len(plaintext)))
    var check3 = $sha384.digest(plaintext)
    doAssert(check1 == digest and check2 == digest and check3 == digest)
    inc(i)

  # SHA 512
  i = 0
  while i < len(code512):
    var plaintext = stripSpaces(code512[i])
    var digest = stripSpaces(digest512[i])
    init(ctx512)
    ctx512.update(cast[ptr uint8](addr plaintext[0]), uint(len(plaintext)))
    var check1 = $ctx512.finish()
    var check2 = $sha512.digest(cast[ptr uint8](addr plaintext[0]),
                                uint(len(plaintext)))
    var check3 = $sha512.digest(plaintext)
    doAssert(check1 == digest and check2 == digest and check3 == digest)
    inc(i)

  # SHA 512/224
  i = 0
  while i < len(code512_224):
    var plaintext = stripSpaces(code512_224[i])
    var digest = stripSpaces(digest512_224[i])
    init(ctx512_224)
    ctx512_224.update(cast[ptr uint8](addr plaintext[0]), uint(len(plaintext)))
    var check1 = $ctx512_224.finish()
    var check2 = $sha512_224.digest(cast[ptr uint8](addr plaintext[0]),
                                    uint(len(plaintext)))
    var check3 = $sha512_224.digest(plaintext)
    doAssert(check1 == digest and check2 == digest and check3 == digest)
    inc(i)

  # SHA 512/256
  i = 0
  while i < len(code512_256):
    var plaintext = stripSpaces(code512_256[i])
    var digest = stripSpaces(digest512_256[i])
    init(ctx512_256)
    ctx512_256.update(cast[ptr uint8](addr plaintext[0]), uint(len(plaintext)))
    var check1 = $ctx512_256.finish()
    var check2 = $sha512_256.digest(cast[ptr uint8](addr plaintext[0]),
                                    uint(len(plaintext)))
    var check3 = $sha512_256.digest(plaintext)
    doAssert(check1 == digest and check2 == digest and check3 == digest)
    inc(i)
