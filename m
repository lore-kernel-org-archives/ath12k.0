Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188C2CCA460
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Subject:References:Message-ID:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=c1yAHa+qx7nhhUqyByJ9CxUowIRdlz8voCKPMlxDfeM=; b=12PRnkMT/gMhPn
	lVY/tojxMiMqt0XSwsxprvhLZni+/7fv3XOOkpP69Y4QmmemaVG0x2cu0+zb+41B8tlE3IDHU8bjW
	qBszYqGi2kOeh9Y3yivYEzNJ/SV+8w3S8KLhAThVCSMCY8zostu+z8qfEN9CaYSJhUV2yrbnY8Ep/
	Pw7PYXvSE3ms7dDIqmkK7IxHqEG3giRj3AcxzFT7OZAFsgfW2LLjTUZ1m7qkig9Dh+QP0winhyDho
	BL2fo60zz/pSaJL6EWdzgeB9RXDWucQWpPC75pBkomOX3vnHGQTGbT9ALLdhBG1PwapljkCc0rG88
	Ag6yhp8l/xkNbArnZlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKTC-0000000069j-3GuT;
	Thu, 15 Oct 2026 12:22:02 +0000
Received: from sonic-usea4-0032.asd.mail.yahoo.com ([34.2.68.31] helo=sonic.asd.mail.yahoo.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKT8-0000000068d-3bOR
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 12:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792066917; bh=c1yAHa+qx7nhhUqyByJ9CxUowIRdlz8voCKPMlxDfeM=; h=Date:From:To:References:Subject:From:Subject:Reply-To; b=DjAYtCp89S7gyGu1zL3cboW11pB/6VhDQEmukd5/2ynqoTgwa1gS0qneW1Tynt/3W6GfZQ93iYa6Rt0j70UICDVGEtidxbYWekO6KmjiNoUT3Ev/fWW9c+6CnfcqKTibxzTPmFwaPjpSy1l0ksPNNUwbfDIqDuVNkoPoCHYj5T5U2BTLNVqba+/kVEVrUo3vCyV9tfwLqsKUqPyoAl/0UaEWAu6YQ9/yCIbfNk8yUxIqSZYEf8cIaF8G1LT3a5b0f3ol5L5Gpv7SyZBOSXPEsBXZGhu7Wo4TEtBj2VQTN4t8ENIn1oKAVmQSoIJ1ldOgUtJe0l7YnBm4T7c3EymHUQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792066917; bh=5+PZ9RLF/sRiSnSy2eQgDVDlCoDLHkFZnTko1FORzr2=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=NXMJqTvjAscQNmyq0hzv83XcreBzkEaGY+TB9vr2h6yJRakcXvEGCOrnoVWNe7Tu226Rel9HA93OGK5ITin1CfQoMce1sIfNFHBBUdzAunPbrc9D4+SFrEvk1OCDJXT2isDpIKv9lh1mOUxAlLf1/OC5eepsz4q0zaTJONOZMEcLuxc8hPe2ykUxnxPVcKVVVaEBEvqB0rEEOWUujbT0Bjl6yvMqDUjmjP6fygPPKUOvcnGfesRVj6Ojc3KJpg2mc447UljpnTyaXBYUONNfRxnIkfuQfw6RLcW4EkMD+3cRYjDuM02qWrCDh97j6C+u/rBC6U8GI2qnBPXQEoBg0A==
X-YMail-OSG: jCF8rZAVM1msg6rcSyACEFZy0SyYOUAKPYNSV.SPa19KQ_Y3FNwdY6OuSJ78c5w
 _v0u2iakWTi7X7FvsCc.TCZyvJ43bIwZw2136DDLzUS25TnQatw12MUy2iWRaCh_e.6hXG_zpzQQ
 9NCgYo87cTLIGIrkd4O0CkPXnbSiW3dba_xKdc8ideN0c.kl2exI1qLhls598EJcu29KCR8Pl6w_
 aHaZWtWlQD_TbZYhFutsmdJ5nwVaQ9bAcUHArH8VvGn1usWeRu8C2aro1mBrxL_DL6aRCl1o09L.
 0zAUAjCjHp61stP9EO0olkzZoTB47qduLUhE.mjic4xvDFnZxso6B5EeLhfmK4qfJu.T3FbXl.Ms
 Fxz3LDT54_XmzRvNQG13u.zTMOTRLXR6dimiaHiTXFfk3ffuJEhVM9ne_Ic_v.PtN2UlpGymfWON
 oI1Jxf8Ec6bA4VprNAr2dmUX52qNoTFEGhSoSD_enUI5fUGqVslFYyn26Xxr0Zen6HJRZox8k91Q
 mLvV.kJgVAXWAxpD4rTwCryC8g24xLZzOJ3LrqZGBeCg5r..XwXuSavnaFxcUe8sLH1ZUX.9spoy
 CuhXFJhA5Binruta8n8hBjpqs2KK2hvWVfkzw6R6H1bBbLg6K9bw88XWwMm4z5GjKtY1LfXrJBa5
 1qrdlRC9B7Hjy538cmavvrUb_dAmxx5aokGR9JnMpkuAVlcaXzEHswLF_r0HjFh99YALkxUlPqUR
 zu0Dp5ssfVtCXk5NddZfTP35Qf3MLYBqjTYsUX8CDPfjc3kkk_BcR7pztmxER_FHY19UnHP66nCw
 5AyKwHEA7M67uRQhRmYiVwg5FP6fHgKBFtGJS9790V.ml5yQLFj_7oJaiue1NNbtnNA_cU6zQliH
 7VIM5whLc.iDBhAeyrHRLgYvJvbMwnGLdu8ZNI6spGlK_rnp7FEyPvpjs3.EahET8AfPw53BFVTY
 1Z7BnX15CtG3u.qD_koKAWtbMQ_TWBqGz43wHH79VCQ2bHDNps6hfSSlEoXm0wvsMrLtkb2eXcgd
 GZYhVPC2.HONl3Le9EuFTQWToRGjc3ehiUAoN2hr4NRhwePi411rScXoIBiC6vG5c7pdJe6Wfjbx
 ksPcGYXanLLVh4fgKOl9wIVlNjx657tMizpg0rmnNH9n37mlSrDMAAVfdOaFVNVlte1poOJKohLh
 zDpYLU.B_PRKSZfMh8qboUZTUciL7JBUA0tHln8QkXy8AxFP8tEog6cvwMwxFlxETx7soweRwHb.
 jsk_ro8y3LDG0diMD6TQNuwT38Wn45tOk83i9SERpRP7Vbz4QjBMax6pjh0Ge9vfw0C8aUuyeCES
 J95GuahtgXTtd_0u.j1CrjRfbafi.qqtt60W0G7ZL6hyHtl65PPWCp5dLFo6U0R5xInF0jTUB0gH
 _TVQIdTMxpRBac0yE43hXmYZqVrsAJpvxl5k58yU9.K8uSskg7cihevjB1Xcyc5ALpcvXrsMG70H
 Vzd13s5cYrOVk19OKK8zJ.cmoQYDOhQEiy8Rxbg1f7QDCiMTZadSdRO87YRah0u1LLR.t7SnSREl
 rM1gTGp7Aw6At8oV8HlyGgkJ.wHcxX8w0MYMVBQwzdis9lOVIr8jn8uh.2dAC3E_aVT2PfNQKVKm
 FGsdnmaoUu_M2eYvE2uN_rYQ.ILVR01rBu4s42aH8URepED4dyU3QAEUzWCBKKUfnlMhzt9vYb3v
 8S3UVpivG6mkyEcB3RFRfDpxgixv6PG5ySCyhqxOJG5CxI5tBwRK3JUmx9FxSrhqnlGlN8mbiU7o
 arqnl3J2RRZ0DgBKx19ibUl4zGTqSoZGfBP3A2GWU3VbpYBhyV3.Xo0INAlEOfP3PSPXo1DxfT.3
 .MgTZ3ZtmaqyRd0tnPyjSR.LM10T9LUDeRDDFy3LdV1yHjNQoEw1XL8Kjz98V1tQf91FCAgt3CuF
 2kTqc22isTiUGi9vwQ.jUfhg7j_wqCbWm3vAp5.qvr63UehzpK5_4o8NAsJCU0fOTqj5QvwTu_q2
 o_8O2YgvnfeLv_xJCHfE3KJMAXiAbNBXukV1LGqcaFiva2dxiUdojmgFlOZ32WL3AALj2sKqU5Cg
 Jfn9.lM3ksIJ3D8X2zxQjzPOCZOkR3KZ.W2FmWINEO1AQ
X-Sonic-MF: <bdthomas84@yahoo.com>
X-Sonic-ID: b491283b-d9a2-4876-adca-59c97146d7b6
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-101 with HTTP; Thu, 15 Oct 2026 12:21:57 +0000
Date: Thu, 15 Oct 2026 12:21:51 +0000 (UTC)
From: brian thomas <bdthomas84@yahoo.com>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Message-ID: <1180896080.87244.1792066911984@mail.yahoo.com>
References: <1180896080.87244.1792066911984.ref@mail.yahoo.com>
Subject: Surface Pro Wifi Issue
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_87243_229712955.1792066911984"
X-Mailer: WebService/1.1.26740 YMailCLDNovation
X-Bad-Reply: References but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_052159_064231_D1D14CA6 
X-CRM114-Status: UNSURE (   4.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

------=_Part_87243_229712955.1792066911984
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,
I'm trying to get the built-in Qualcomm WCN7850 Wi-Fi 7 adapter working under Linux on a Microsoft Surface Pro 5G for Business, 13-inch 12th Edition Intel.
System details
* Distribution: CachyOS x86_64
* Kernel: 7.2.9-2-cachyos
* BIOS: 12.15
* Wi-Fi PCI ID: 17cb:1107
* PCI subsystem: 00ac:1414
* Kernel module: ath12k_wifi7
* Hardware: WCN7850 hw2.0
* QMI chip ID: 2
* QMI board ID: 255
The Wi-Fi device is detected, but it fails to initialize because the installed board-2.bin doesn't contain a matching entry.
The requested board identifier is:
bus=pci,vendor=17cb,device=1107,subsystem-vendor=00ac,subsystem-device=1414,qmi-chip-id=2,qmi-board-id=255
With the standard Linux firmware (WLAN.HMT.1.1.c7-00108), initialization fails with:
qmi failed to load board data file:-2
I extracted the official Microsoft Windows Qualcomm driver package, which explicitly includes this PCI subsystem ID and supplies a default bdwlan.elf alongside several numbered bdwlan01 variants.
I tested the default Microsoft board image as a standalone board.bin, both with Linux c7-00108 firmware and older c5-00302 firmware. In both cases, the board-data transfer timed out with error -110.
I restored the original Linux firmware afterward.
Could you advise how to identify or obtain the correct Linux board-data image for this Surface model, and whether support for subsystem 00ac:1414 could be added to the official WCN7850 board-data bundle?
I'm happy to provide additional logs or test a validated firmware or board-data update.
Thank you.
------=_Part_87243_229712955.1792066911984
Content-Type: text/plain
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="=?UTF-8?b?c3VyZmFjZS1hdGgxMmstbG9nLnR4dA==?="
Content-ID: <ef8af4eb-d044-3fe4-3052-21d18549e797@yahoo.com>

T2N0IDE1IDAxOjU0OjQ2IGNhY2h5b3MteDg2NjQga2VybmVsOiBhdGgxMmtfd2lmaTdfcGNpIDAw
MDA6YTI6MDAuMDogQkFSIDAgW21lbSAweGEwMjAwMDAwLTB4YTAzZmZmZmYgNjRiaXRdOiBhc3Np
Z25lZApPY3QgMTUgMDE6NTQ6NDYgY2FjaHlvcy14ODY2NCBrZXJuZWw6IGF0aDEya193aWZpN19w
Y2kgMDAwMDphMjowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKT2N0IDE1IDAx
OjU0OjQ2IGNhY2h5b3MteDg2NjQga2VybmVsOiBhdGgxMmtfd2lmaTdfcGNpIDAwMDA6YTI6MDAu
MDogV2ktRmkgNyBIYXJkd2FyZSBuYW1lOiB3Y243ODUwIGh3Mi4wCk9jdCAxNSAwMTo1NDo0NiBj
YWNoeW9zLXg4NjY0IGtlcm5lbDogYXRoMTJrX3dpZmk3X3BjaSAwMDAwOmEyOjAwLjA6IE1TSSB2
ZWN0b3JzOiAxNgpPY3QgMTUgMDE6NTQ6NDcgY2FjaHlvcy14ODY2NCBrZXJuZWw6IGF0aDEya193
aWZpN19wY2kgMDAwMDphMjowMC4wOiBxbWkgZG1hIGFsbG9jYXRpb24gZmFpbGVkICg3Mjc0NDk2
IEIgdHlwZSAxKSwgd2lsbCB0cnkgbGF0ZXIgd2l0aCBzbWFsbCBzaXplCk9jdCAxNSAwMTo1NDo0
NyBjYWNoeW9zLXg4NjY0IGtlcm5lbDogYXRoMTJrX3dpZmk3X3BjaSAwMDAwOmEyOjAwLjA6IGNo
aXBfaWQgMHgyIGNoaXBfZmFtaWx5IDB4NCBib2FyZF9pZCAweGZmIHNvY19pZCAweDQwMTcwMjAw
Ck9jdCAxNSAwMTo1NDo0NyBjYWNoeW9zLXg4NjY0IGtlcm5lbDogYXRoMTJrX3dpZmk3X3BjaSAw
MDAwOmEyOjAwLjA6IGZ3X3ZlcnNpb24gMHgxMTAzMDA2YyBmd19idWlsZF90aW1lc3RhbXAgMjAy
Ni0wMy0wNiAwOToxMCBmd19idWlsZF9pZCBRQ19JTUFHRV9WRVJTSU9OX1NUUklORz1XTEFOLkhN
VC4xLjEuYzctMDAxMDgtUUNBSE1UU1dQTF9WMS4wX1YyLjBfU0lMSUNPTlpfVVBTVFJFQU0tMwpP
Y3QgMTUgMDE6NTQ6NDcgY2FjaHlvcy14ODY2NCBrZXJuZWw6IGF0aDEya193aWZpN19wY2kgMDAw
MDphMjowMC4wOiBmYWlsZWQgdG8gZ2V0IEFDUEkgQkRGIEVYVDogMApPY3QgMTUgMDE6NTQ6NDcg
Y2FjaHlvcy14ODY2NCBrZXJuZWw6IGF0aDEya193aWZpN19wY2kgMDAwMDphMjowMC4wOiBmYWls
ZWQgdG8gZmV0Y2ggYm9hcmQgZGF0YSBmb3IgYnVzPXBjaSx2ZW5kb3I9MTdjYixkZXZpY2U9MTEw
NyxzdWJzeXN0ZW0tdmVuZG9yPTAwYWMsc3Vic3lzdGVtLWRldmljZT0xNDE0LHFtaS1jaGlwLWlk
PTIscW1pLWJvYXJkLWlkPTI1NSBmcm9tIGF0aDEyay9XQ043ODUwL2h3Mi4wL2JvYXJkLTIuYmlu
Ck9jdCAxNSAwMTo1NDo0NyBjYWNoeW9zLXg4NjY0IGtlcm5lbDogYXRoMTJrX3dpZmk3X3BjaSAw
MDAwOmEyOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZC5iaW4gZnJvbSBXQ043ODUwL2h3Mi4w
Ck9jdCAxNSAwMTo1NDo0NyBjYWNoeW9zLXg4NjY0IGtlcm5lbDogYXRoMTJrX3dpZmk3X3BjaSAw
MDAwOmEyOjAwLjA6IHFtaSBmYWlsZWQgdG8gbG9hZCBiZGY6Ck9jdCAxNSAwMTo1NDo0NyBjYWNo
eW9zLXg4NjY0IGtlcm5lbDogYXRoMTJrX3dpZmk3X3BjaSAwMDAwOmEyOjAwLjA6IHFtaSBmYWls
ZWQgdG8gbG9hZCBib2FyZCBkYXRhIGZpbGU6LTIK

------=_Part_87243_229712955.1792066911984--

