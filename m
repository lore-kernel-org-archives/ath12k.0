Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF22AD6EC04
	for <ath12k@archiver.kernel.org>; Fri, 29 Nov 2024 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UOXGnF8rawmmMZMNz52lIkfhsV+J9mefPXfOF/Ycks=; b=Kmo+GwdjC/T+IhoN5/wu62Crhs
	drV4abZsSgmE6DzBerZbhprP2ySffrsimQ2byULqaisOM7ndhOOUokkReY1FSHhNUutpTgdZopTsZ
	CD9oEIaVcsFfdoDAD7GYBNlcxB3QwPM+HraWWG1Umshrwg7DElB4pdE4B48tgqmE35ECz2jUDoq19
	NCBtVlf3VLg/eZj8xkyE31+FZDuDtY3l9FuWCCzjqPfsOGUgm7WTbifOuriz2fZ8Eu6g+DMyDpb/d
	nhCPk5fsbP/dSfWjUlJVRwh8z4vo9BLUOU3IUni5O5r+lmzoJdwnGIqBmdc+J+ewwWYati0lHCPLw
	DAr22VfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGzwx-000000003QJ-2xsw
	for ath12k@archiver.kernel.org;
	Fri, 29 Nov 2024 12:18:19 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGzwv-000000003Pl-2wXY
	for ath12k@lists.infradead.org;
	Fri, 29 Nov 2024 12:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732882695; bh=5UOXGnF8rawmmMZMNz52lIkfhsV+J9mefPXfOF/Ycks=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lzPShPi02VNpHNNGAQ0aba1eV5i7DJ/ZfCGPvEM05iYGNXUNiJM/0gwXuwH2Ds/wy
	 qAKuGur2s+sTdA4LKLZ/TOJ66tRo8chtxEhtnbtHGemZ0/Edwn0sXwT0+MLJH5eLqk
	 ETkWop1ABfoZ4uzQz4zJBnwvSzUG1It/uN/t6GWk=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 9FD4814886E3;
	Fri, 29 Nov 2024 13:18:15 +0100 (CET)
Message-ID: <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
Date: Fri, 29 Nov 2024 13:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 xsFNBEjok5sBEADlDP0MwtucH6BJN2pUuvLLuRgVo2rBG2TsE/Ijht8/C4QZ6v91pXEs02m0
 y/q3L/FzDSdcKddY6mWqplOiCAbT6F83e08ioF5+AqBs9PsI5XwohW9DPjtRApYlUiQgofe9
 0t9F/77hPTafypycks9buJHvWKRy7NZ+ZtYv3bQMPFXVmDG7FXJqI65uZh2jH9jeJ+YyGnBX
 j82XHHtiRoR7+2XVnDZiFNYPhFVBEML7X0IGICMbtWUd/jECMJ6g8V7KMyi321GP3ijC9ygh
 3SeT+Z+mJNkMmq2ii6Q2OkE12gelw1p0wzf7XF4Pl014pDp/j+A99/VLGyJK52VoNc8OMO5o
 gZE0DldJzzEmf+xX7fopNVE3NYtldJWG6QV+tZr3DN5KcHIOQ7JRAFlYuROywQAFrQb7TG0M
 S/iVEngg2DssRQ0sq9HkHahxCFyelBYKGAaljBJ4A4T8DcP2DoPVG5cm9qe4jKlJMmM1JtZz
 jNlEH4qp6ZzdpYT/FSWQWg57S6ISDryf6Cn+YAg14VWm0saE8NkJXTaOZjA+7qI/uOLLTUaa
 aGjSEsXFE7po6KDjx+BkyOrp3i/LBWcyClfY/OUvpyKT5+mDE5H0x074MTBcH9p7Zdy8DatA
 Jryb0vt2YeEe3vE4e1+M0kn8QfDlB9/VAAOmUKUvGTdvVlRNdwARAQABzR9NaWhhaSBNb2xk
 b3ZhbiA8aW9uaWNAaW9uaWMuZGU+wsGfBBMBCABJAhsjAh4BAheAAhkBCwsKDQkMCAsHAQMC
 BxUKCQgLAwIFFgIDAQAWIQRuEdCPdTOBx0TxyDwf1i7ZbiU6hwUCZwAtBAUJH/jM6QAKCRAf
 1i7ZbiU6h8JHD/9odGNQMC0c/ZyvY80RFQTdi63cIc0aLG7kbYvUmCVQbNN/r6pGDVKXiBqa
 DjrB3knyYpcAVq2SIRZLjkCgCGQimfb3IZVfyl730fc8Z1xdQ87/FbHrdqIjNFyvYgkM24AU
 VoAyw0EBm99TiO/MFaHmD4T75l437EWA8KbDha9p+N2GHcxYJeJbQJ6rajpQZ0HFF20b5jF8
 8de2g8kbQR1GPJgGGmJ8m07kfEl2kcgEwI/HZ3tVUBTwJ+dJf6IWy4pC8DZiZWaQao31nVzC
 RbpqOtevh/P6MeNeDKHBjlV0rEStCCz0xtA4U8/vDOVnk42IqsxkRmiPNh4U62jkh10D2CMd
 kCiBoOgU5KGC2Tbnc8XWr2E5AJywpsmFlTZ77Gv1HoKp1tOQ2RMNVWNqGV89BaUm15BSRPHG
 qzp7Tm4eMLnMvJyon36B01N/JRuNpDpHeGnDHyeqhnQqE8jrqQnwi2TDa2dKuHLlD9Of8LyV
 ewCwiVUhdWIINdTjkyN/0brzr//mhg6H/iEpnkm5i++gsRvQZgZip5ft51jzMjRg1nZujfYZ
 Ow2ss2kSQ3gA3rfRhxx3OAqa5b45CH56rvmY97wHBrWbJxevqNj6quLBNtl64aceJWyTgWue
 vShUhOP6wz5qq/+SxkKRiGndjE1HVmx4iOO413Crz0QfawCIjs7BTQRI6JObARAA8Prkme+B
 PwRqallmmNUuWC8Yt+J6XjYAH+Uf0k/H6MLA7Z+ZL8AHQ+0N306r/YFVnw2SjhaDODwhRoMv
 dOKtoIcJZ9L0LQAtizhZMbHCb+CMtcezGZXamXXpk10TzrbI9gnROz1xBnTkzpuOkgo43HRx
 7GuYy+imM4Lxh/hfgRM6MFjQlcIsUd0UGRCxuq8QmxRqQpRougCwPeXjfOeMRkaQUI7A8kLJ
 7bTmSzjB9fSBv63b7bajhFHid1COYGe3EZOYRi1RTzblTnq2Fdv+BN/ve/9BdZgApfRSX8Qk
 uLsuZF9OWHxIs3wwpvqFoyBXR29CqgrcQFFA/Lm3i/de3kFuXJUVFTYM4tLwV85J9yGtK6nU
 sA/v6LXcaTGrQ9P3rJ3iVPYKuyF2w8IMqvFTnHu6+nCvBJxLymOsYJFN4W/5TYdWk1hdIYmm
 NlM/PH+RWL8z+1WWZgZOBPFJ0FQQbDvTMP6m0/GZT1ZFUVoBG/FAiIQ9UDl8gRsGfe0wS6gz
 k2evXeAZQyZCii3Dni7Di2KjaPpnl/1F7Zelueb7VbgdoPRmND9rFixI6bFC4yjlSnL5iwIi
 ULDkLDJN5lcRHI5FO/6bzwVSgHmI+eMlNA/hysdTtp9AjE7VkVxeC9TJ+kEZDv5VUTSxUpNs
 Wj922PkX+78EYPPGTOG4xx7PMqcAEQEAAcLBfAQYAQgAJgIbDBYhBG4R0I91M4HHRPHIPB/W
 LtluJTqHBQJnAC0SBQkf+Mz3AAoJEB/WLtluJTqHtDUP/0O2gsMtgo07wIOrClj6UQJIs8PL
 2sLHwvcmhQyFxPpa8wUAckJ2n3OpbjP22HP8tObT+Nhs7czTwelEFNdVcINBjnEPvJ5JNDuY
 h0qmP9wE6rQc2MKdS0ZjggeS4zEkiQI/WVOWhRTVNYUASQHMqrOB2ZZ6QWqND5uqfRTNfHAd
 5bDGl4FNpH9lklmXTm/CbR0V0cYgkYCOUTLmNkur4AZIz5WPMgYXakz9K94SFzEDjZqr+nko
 S1hPiakYd3lUNXy9LAQ/YD7balC80jhB+/CFcb0DgNwADVjLz6lAwYl0/r5WGCBIVy0kwq4b
 dtO59zKJ4wAIKysW2Z42UJ5TvwinuOAHKHrZ3E17MQNNojcgi0tw88mSSkfDrZVqFKzjruhm
 HAe7PMdAJ1C4i21U6N5CSG+UwORWnPXKiKYbi3u9LXHqMwwzPxiAGbnmu4F4Fe7pHidRPTX8
 xa2k8AipcPkLlwnm1ZKP/gZL0+NLUR9ky2W2B8YpfGwqBVuQ/C30PkXaEydd2IaVd+Lv6lLj
 4zysWLWKUKPFdlI744AxkyDlFlbFbmICgQJ0AuBmgJRLtjLAfIlOKgfZguWA+uCo4F/mPZ7x
 5CGLSvKqaA3YaiH85ziT5CjbFlMjbZrTHvI4/gprmgHEdec5BgQAaZ+z8sIbplcJwNp+GDq2
 S0VlnF9z
In-Reply-To: <20241017030927.1695-1-quic_kangyang@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0NTLs8ELBgWaZSegJaVoLkVk"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_041817_915038_15347617 
X-CRM114-Status: GOOD (  16.01  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0NTLs8ELBgWaZSegJaVoLkVk
Content-Type: multipart/mixed; boundary="------------WuJYlbBPDjgoKyBZ75knt3wq";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Message-ID: <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
In-Reply-To: <20241017030927.1695-1-quic_kangyang@quicinc.com>

--------------WuJYlbBPDjgoKyBZ75knt3wq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMC8xNy8yNCAwNTowOSwgS2FuZyBZYW5nIHdyb3RlOg0KPiBUaGlzIHBhdGNoLXNl
dCBtYWlubHkgZG9lcyBmb3VyIHRoaW5nczoNCj4gMS4gQWRkIGhhbmRsZXIgdG8gc2VuZCBX
TUlfU0VUX0NVUlJFTlRfQ09VTlRSWV9DTURJRCB0byBmaXJtd2FyZS4NCj4gMi4gSW1wbGVt
ZW50IDExZCBzY2FuIG9mZmxvYWQsIGFuZCByZXBvcnQgY291bnRyeSBjb2RlIHRvIGZpcm13
YXJlIGJ5DQo+IFdNSSBjb21tYW5kIFdNSV9TRVRfQ1VSUkVOVF9DT1VOVFJZX0NNRElELg0K
PiAzLiBVc2UgV01JX1NFVF9DVVJSRU5UX0NPVU5UUllfQ01ESUQgdG8gc2V0IGNvdW50cnkg
Y29kZSBmb3IgV0NONzg1MC4NCj4gNC4gU3RvcmUgY291bnRyeSBjb2RlLCBhbmQgdXBkYXRl
IGl0IHRvIGZpcm13YXJlIGFmdGVyIGRldmljZSByZWNvdmVyeS4NCj4gDQo+IFdpdGggdGhp
cyBwYXRjaC1zZXQsIFdDTjc4NTAgY2FuIGRvIDExZCBvZmZsb2FkIHNjYW4gYW5kIHVwZGF0
ZSBjb3VudHJ5DQo+IGNvZGUgdG8gZmlybXdhcmUgc3VjY2Vzc2Z1bGx5Lg0KPiANCj4gTm90
ZTogVGhpcyBwYXRjaC1zZXQgaXMgYW4gb2xkIHBhdGNoLXNldCBpbiBwdWJsaWMgcmV2aWV3
IHdyaXR0ZW4gYnkNCj4gV2VuIEdvbmcuIEp1c3QgcmVzZW5kIGl0IGZvciBoaW0uDQo+IExp
bms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVz
cy9jb3Zlci8yMDIzMDkxNDA5MDc0Ni4yMzU2MC0xLXF1aWNfd2dvbmdAcXVpY2luYy5jb20v
DQoNCkhhdmUgeW91IHRlc3RlZCB0aGlzIGluIEFQIG1vZGUgb3Igd2FzIHRlc3RpbmcgbGlt
aXRlZCB0byBTVEEgbW9kZT8NCg0KRXZlbiB3aXRoIHRoaXMgcGF0Y2ggc2V0LCBob3N0YXBk
IGZhaWxzIHRvIHN0YXJ0IG9uIGEgY2hhbm5lbCB0aGF0IGlzIGRpc2FibGVkIA0KaW4gdGhl
IGRlZmF1bHQgcmVnZG9tYWluLCBldmVuIGlmIDExZCBpcyBlbmFibGVkIGFuZCBhIENDIHNw
ZWNpZmllZCwgZXZlbiBhZnRlciANCmEgQ0MgdXBkYXRlIGlzIHJlcXVlc3RlZCBhbmQgQ0hB
TkVMX0xJU1RfVVBEQVRFIGlzIGJlaW5nIHJlY2VpdmVkLg0KDQotLS0NCjE3MzI4ODEyNDUu
NjM3MDU5OiB3aWZpYmU6IGludGVyZmFjZSBzdGF0ZSBVTklOSVRJQUxJWkVELT5DT1VOVFJZ
X1VQREFURSANCiAgDQoNCjE3MzI4ODEyNDUuNjM3MjY4OiBQcmV2aW91cyBjb3VudHJ5IGNv
ZGUgbmEsIG5ldyBjb3VudHJ5IGNvZGUgREVJDQoxNzMyODgxMjQ1LjYzNzI4MzogQ29udGlu
dWUgaW50ZXJmYWNlIHNldHVwIGFmdGVyIGNoYW5uZWwgbGlzdCB1cGRhdGUNCjE3MzI4ODEy
NDUuNjM3MjkxOiBjdHJsX2lmYWNlIG5vdCBjb25maWd1cmVkISANCg0KMTczMjg4MTI0NS42
MzczMTg6IFJUTV9ORVdMSU5LOiBpZmlfaW5kZXg9NiBpZm5hbWU9d2lmaWJlIG9wZXJzdGF0
ZT0wIGxpbmttb2RlPTAgDQppZmlfZmFtaWx5PTAgaWZpX2ZsYWdzPTB4MTA0MyAoW1VQXVtS
VU5OSU5HXSkNCjE3MzI4ODEyNDUuNjM3MzcxOiBSVE1fTkVXTElOSzogaWZpX2luZGV4PTYg
aWZuYW1lPXdpZmliZSBvcGVyc3RhdGU9MiBsaW5rbW9kZT0wIA0KaWZpX2ZhbWlseT0wIGlm
aV9mbGFncz0weDEwMDMgKFtVUF0pDQoxNzMyODgxMjQ1LjYzNzQwNDogUlRNX05FV0xJTks6
IGlmaV9pbmRleD02IGlmbmFtZT13aWZpYmUgb3BlcnN0YXRlPTIgbGlua21vZGU9MCANCm1h
c3Rlcj01IGlmaV9mYW1pbHk9MCBpZmlfZmxhZ3M9MHgxMDAzIChbVVBdKQ0KMTczMjg4MTI0
NS42Mzc0MzQ6IFJUTV9ORVdMSU5LOiBpZmlfaW5kZXg9NiBpZm5hbWU9d2lmaWJlIG9wZXJz
dGF0ZT0yIGxpbmttb2RlPTAgDQptYXN0ZXI9NSBpZmlfZmFtaWx5PTAgaWZpX2ZsYWdzPTB4
MTAwMyAoW1VQXSkNCjE3MzI4ODEyNDUuNjM3NDY0OiBSVE1fTkVXTElOSzogaWZpX2luZGV4
PTYgaWZuYW1lPXdpZmliZSBtYXN0ZXI9NSBvcGVyc3RhdGU9MiANCmlmaV9mYW1pbHk9NyBp
ZmlfZmxhZ3M9MHgxMDAzIChbVVBdKQ0KMTczMjg4MTI0NS42Mzc1MDU6IG5sODAyMTE6IEFk
ZCBpZmluZGV4IDUgZm9yIGJyaWRnZSBicnZzd2l0Y2gNCjE3MzI4ODEyNDUuNjM3NTE0OiBu
bDgwMjExOiBBZGQgb3duIGludGVyZmFjZSBpZmluZGV4IDUgKGlmaWR4X3JlYXNvbiA2KQ0K
MTczMjg4MTI0NS42Mzc1MjE6IG5sODAyMTE6IGlmaW5kZXggNSBhbHJlYWR5IGluIHRoZSBs
aXN0DQoxNzMyODgxMjQ1LjYzNzU0MDogbmw4MDIxMTogRXZlbnQgbWVzc2FnZSBhdmFpbGFi
bGUNCjE3MzI4ODEyNDUuNjM3NTYzOiBubDgwMjExOiBEcnYgRXZlbnQgMzYgKE5MODAyMTFf
Q01EX1JFR19DSEFOR0UpIHJlY2VpdmVkIGZvciANCndpZmliZQ0KMTczMjg4MTI0NS42Mzc1
NzQ6IG5sODAyMTE6IFJlZ3VsYXRvcnkgZG9tYWluIGNoYW5nZQ0KMTczMjg4MTI0NS42Mzc1
ODA6ICAqIGluaXRpYXRvcj0xIA0KDQoxNzMyODgxMjQ1LjYzNzU5MDogICogdHlwZT0wIA0K
DQoxNzMyODgxMjQ1LjYzNzU5NTogICogYWxwaGEyPURFIA0KDQoxNzMyODgxMjQ1LjYzNzYw
OTogd2lmaWJlOiBFdmVudCBDSEFOTkVMX0xJU1RfQ0hBTkdFRCAoMjcpIHJlY2VpdmVkIA0K
ICANCg0KMTczMjg4MTI0NS42Mzc2MTk6IENoYW5uZWwgbGlzdCB1cGRhdGVkIC0gY29udGlu
dWUgc2V0dXAgDQogIA0KDQoxNzMyODgxMjQ1LjYzODQ3NTogbmw4MDIxMTogUmVndWxhdG9y
eSBpbmZvcm1hdGlvbiAtIGNvdW50cnk9bmENCjE3MzI4ODEyNDUuNjM4NDk5OiBubDgwMjEx
OiAyNDAyLTI0NzIgQCA0MCBNSHogMjAgbUJtDQoxNzMyODgxMjQ1LjYzODUxMjogbmw4MDIx
MTogMjQ1Ny0yNDgyIEAgMjAgTUh6IDIwIG1CbSAobm8gSVIpDQpbLi4uXQ0KLS0tDQoNCklu
dGVyZXN0aW5nbHksIGl3IHJlZyBnZXQgc2hvd3MgdGhlIG5ldyBDQy9yZWdkb21haW4gYWZ0
ZXIgaG9zdGFwZCB0ZXJtaW5hdGVzLCANCnNvIEkgc3VzcGVjdCBhIHJhY2UgY29uZGl0aW9u
Og0KDQotLS0NCnBoeSMwIChzZWxmLW1hbmFnZWQpDQpjb3VudHJ5IERFOiBERlMtRVRTSQ0K
LS0tDQoNClN0YXJ0aW5nIGhvc3RhcGQgYWdhaW4gYWZ0ZXIgaXQgZmFpbGVkIHRoZSBmaXJz
dCB0aW1lIGFyb3VuZCB3b3Jrcywgc2luY2UgdGhlIENDIA0KKyByZWdkb21haW4gYXJlIGNv
cnJlY3RseSB1cGRhdGVkIGJ5IHRoYXQgdGltZS4NCg0KDQpZb3UgcmVjZW50bHkgcmUtc3Vi
bWl0dGVkIGEgcGF0Y2ggc2V0IGZvciBhdGgxMWsgYnkgV2VuIEdvbmdbMF0gdGhhdCBpcyBz
dXBwb3NlZCANCnRvIGZpeCBhIHJhY2UgY29uZGl0aW9uIGR1cmluZyByZWcgdXBkYXRlcyBh
bmQgdGhpcyBzbWVsbHMgbGlrZSB0aGUgc2FtZSBpc3N1ZS4gDQpJJ2xsIHRyeSB0byBwb3J0
IGl0IHRvIGF0aDEyayBvbiB0b3Agb2YgdGhpcyBwYXRjaCBzZXQgdG8gc2VlIGlmIGl0IGZp
eGVzIHRoaXMgDQppc3N1ZS4NCg0KDQoNCk1paGFpDQoNCg0KDQpbMF0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYXRoMTFrLzIwMjQxMTI5MDcwNzE0LjIyNi0xLXF1aWNfa2FuZ3lhbmdA
cXVpY2luYy5jb20NCg==

--------------WuJYlbBPDjgoKyBZ75knt3wq--

--------------0NTLs8ELBgWaZSegJaVoLkVk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdJsQYFAwAAAAAACgkQH9Yu2W4lOodJ
WhAAz9+gPFQpCu8XnFB+sBgTeVcL0VjZpSSPXtJPEd5SY145h4a9DxYlqEACm6QKzBsXBWYbkP6c
5JzBlZfLtiEgaJimoKQ8Utz5cWBrYbQPO+xv/f2QJK+3DLXiZV5gmid0iccIaznOMn8lwV2Ajvep
lMGphKITqnOzOP35dVAyuyVBcOizsA08gS0wIr8F+to1+pabBLlHpfbK+jA1sGXJUD/zFHl3bj5J
fsqqs/Al5uxiJ29W7Sz9HdTdGaU54yvhOE3CqST0mKzZOuGQ63QyCZID5dqpHHEArOh+zUa2SK9u
AAGtd0hh+zRycNptQ3MjxMtXNp+uQ+ubrJeMVibESWooz2KBJDnAPjwj/QnAy5+gCivAvOm3GcWI
WKzgcxAcZfOx+/ZF0n7eiDySUfYs2Uw5v8T3Ksd5xzXTJK2cUQHlktPd8V5GhC4shuOElHDgkxzk
jYbJ2XH/jalWh33hQiOuM2tSp3BKxq0w1uKFowNBy9YRZyb5lBnXqN6Ej3ppKivF1M4+rREH7bnf
gaDk7ieWr4RAsAf0ury2DUIycgUiLAXbRueN7VSkvmqXlXiuC8uqV/GYqXvH+/EjBgn0fdEvjw9i
qlckjx3RyJnGgjSXUIon1Q7VU0buOkuDMRpQtgiNrklgwfCgDT9c/7ocpz/BO6nJJOuZ2j4nMSbl
MVk=
=I2AU
-----END PGP SIGNATURE-----

--------------0NTLs8ELBgWaZSegJaVoLkVk--

