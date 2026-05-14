Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381F3CD4F25
	for <ath12k@archiver.kernel.org>; Thu, 14 May 2026 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:Content-Type:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgDwSfoHlPR4BzQVDlImDB1JZ9TsM+Jv3+MUyy8Okhw=; b=o1pt/oBHBruNPtM7TEzxdVt7Lq
	Pbw5NFzI3FWILWhdChHmWgMfqMdqN3qbak1L+Aa8bcmf8fWg+URsb39EBG74x07+WxqFIXnkb72bw
	3HlYiWnaEC0XMGTUEkbr5Q1PGk7xbeGTmneFDPaurkmj3478299pxb3aMEmi8Ki9CMbCVM2XqMioE
	BYgR2u0ZtjguIo4RzNFZ4XghnJixuBx4kWNbKzkIXTpqWLaZ6uNgtezj9iWSrKHSxGaSJfmCgTtqm
	kcJJAwW5ca/cih0e9WRLtdQ3ILhqwRMNcm0DdqKxUOu9XwTYrucO6NYhG/i5SexDs+xdhQJaiyxPA
	+kcrE6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRkf-00000004z5l-3mbS;
	Thu, 14 May 2026 08:49:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRkd-00000004z5E-2Uwa
	for ath12k@lists.infradead.org;
	Thu, 14 May 2026 08:49:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E1qkM91762768
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 08:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgDwSfoHlPR4BzQVDlImDB1JZ9TsM+Jv3+MUyy8Okhw=; b=cXrFWDZl0GE52Ums
	pu0rRBT3oUVWHLSPFGzKJFr83JroblC1GNQ7jFCb/5QVqzEV8vIIcJT8avkI5p6Z
	nBzgLyDyRJM0Fd3Q516AHU4zsHc4J/hujgRvCEgfR+NUpdk4Ai/tUxZKOeDLz1NE
	5a2cl3tnNjoNCWa+Re1ivILdZcZC7fagcniSyBRwkCtS9qXSDk3S12EYAcwQpTrM
	6BO4nOKLtY++cyC202z0FXncQqq52cTWa19LZ7clYnnGw14EDgqsQhXg9pn+ADaW
	+iDuxKPlPMNA8EdMlN6iI5Qm8kVLh+CD+NuuRE2Jjby3MIMw64L8Jdrr4n2/SKsB
	21LpNg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554a986y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 08:48:58 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-132d5ad9c32so5619674c88.0
        for <ath12k@lists.infradead.org>; Thu, 14 May 2026 01:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778748538; x=1779353338; darn=lists.infradead.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgDwSfoHlPR4BzQVDlImDB1JZ9TsM+Jv3+MUyy8Okhw=;
        b=hX/iSisp4FzAmKpOO8DSP0lfQGCMiA9dFDLQjItpxuTPEhaKYDWt+cmpV3HnSqZ/nj
         p962Dznf0jzC0uBSumx2cOgxYU/pU5Zq6MbaQ0nCRXuIlv4VJDvGt5TETqLCMWGHSPEo
         7wV5Vp9b2bzX1rtkETIP6Ec0YGubW0qH1OZKbDAE7QHYzRs0ghuDKylPPA0TMHk1iQBM
         uw9k8cQN8MVoVU1o1PXeIjAG0AnHWcl9lFzpp1iZfBcuUmc5FB8bRhg3RE3pKycRL0Aa
         Vb98mnXikKQDvOB2P8lGjoEHZzPH0geBLEfD2PiikqvPIpWkoz8XlDPmxxYmt7Z8n9za
         imkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778748538; x=1779353338;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgDwSfoHlPR4BzQVDlImDB1JZ9TsM+Jv3+MUyy8Okhw=;
        b=YmYMOBl59qegihnFNvcQ1e9WUEucT8o3tVpKqd4gJ2yYcelOpzRGneTy5uolp5WaCL
         qD0+JoktLCBYxbZaUYwjxBCbMCTjEOwNoScJuSkLIIZvyezSayvEiYfTWzdALzBy4JYX
         yuDCwYHtoSQ1KGGJ4OsRTM6afg84Ng2vy4ogTvoValojckdAzftNKZFcNBylt6M6BMQL
         tADSjTSpEfreTF+NiGYk4CRmXaGBqj/Yx2rH5M9alcdoCSX5AUhgTwgIztlkeEG/bIKX
         FW/HysG6XezmAUT63EQu1tr1A0ipDuMyEoOP1x3s0K7/r0d5uOrSx63UK8bgzU6U65ct
         W9LQ==
X-Gm-Message-State: AOJu0YxHVBUC2nmcW6XbZK17OLPPqoxyNa5oBmfzESJMF94pH0n1BBDl
	HfDIMrTlCb0bcLCUOiGDbF6R1JD+BTVfaCiBroEWFLB6UBu28pHwGXPrss/1VP3ZXjpAt3oQiUW
	s7lm2RQcCiXPT9qogzoMYlahmRCZ70wTAc6xn8S8NsmiuoJ+HlA2N2qEkJIcD6UxK
X-Gm-Gg: Acq92OEwz1hPfEmMblWfGCdqSkPt4ypFTIoGvPWE523OprS7v4BuceMCAglvjuqU3zP
	zmEC+RyNXFY24TMtavKgOLjME6nxaryZ3wsYRsCoIwFtH+r5vmeYV6fimP3+ba1ZP7jY9Tmbo7j
	xwi/y+FopZb2dAcOcRZV5f8C7EmShw/bfbmvZSv0jv8mtY69Do10PNJQmQa9b2RNk7C8cjswdIc
	lao+5spBJ9ni/gHtZHuubrisKW3dlITWJm4wkHA3N7zhLttqqLsFFK2PHHeNSl4h7qB8KAauCAp
	AIDGh4/jVjNcPQxDmQzuW7Op/sEjFELDnizVp7YaswMz3P5kx0w5zzeKugXhgFr/+Qz9omMsmMf
	HJBRy7dc2lIJFhEa9w3VdZYlDKkKGYLIbnG67dGNVWWw9jsjN155mKO0O2Rg=
X-Received: by 2002:a05:7022:f516:b0:134:7497:2148 with SMTP id a92af1059eb24-13474972255mr2575891c88.28.1778748537871;
        Thu, 14 May 2026 01:48:57 -0700 (PDT)
X-Received: by 2002:a05:7022:f516:b0:134:7497:2148 with SMTP id a92af1059eb24-13474972255mr2575877c88.28.1778748537392;
        Thu, 14 May 2026 01:48:57 -0700 (PDT)
Received: from [127.0.1.1] (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm3658567c88.0.2026.05.14.01.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:48:57 -0700 (PDT)
Message-ID: <6a058c79.4ede001e.7a438.4eff@mx.google.com>
Date: Thu, 14 May 2026 01:48:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Amith A <amith.a@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: Add support for handling incumbent signal interference in 6 GHz
In-Reply-To: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
References: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
X-Proofpoint-GUID: wBomq42oE0qCbAHbcCNjvRBxnVhnJ-Lw
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a058c7a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8NM31TEM1mEMm4nbO4kA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: wBomq42oE0qCbAHbcCNjvRBxnVhnJ-Lw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA4NSBTYWx0ZWRfX5s91YmDSlFZP
 L6BYdRyCQYWVI+HWWq/OOoGTPynJCR2zCUuV80I3WxUjVP5NhX51X5KobpTevneZjerg637YjmY
 z7pqsS/Iz/wT1JC8YehV35FPz6zQyfBI3JNXVLnAMHzvVru88I72t2niqOTyUl3UHciXdZ2wBL4
 8ZbQOb26amaetMEw4WP2gcf+/8dcHW+VU7pRAenBLBqJugFfjWliy/w22a0o9+owRceR5QVP90a
 cC0sF74ZRpOyHHYHg46E20gpZUNTy6HlkknYu2l22Z57AqtEA7wfilFKZsjWQkFZyxe+HwO7Fxn
 v88BmDfQD2DP/DhrERmA/6j0oLZ4L+q3O70Rd3HRq/aH746iF4tZ559oM+NiZ11tlwAf6O6MM4C
 BSQLuDJYtmV5ZFgeaiKmfq8cZOftl9yc03LS5PwdLnCnbDAJJPIWRLRm1XWAMt6GZNJtQ7RbOMD
 t8kYd4LB9xxQ0cTkIFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_014903_657265_ABAFCA99 
X-CRM114-Status: GOOD (  19.15  )
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

T24gTW9uLCAxMSBNYXkgMjAyNiAwOTozMjo0MCArMDUzMCwgQW1pdGggQSB3cm90ZToKPiBUaGlz
IHBhdGNoIHNlcmllcyBhZGRzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBoYW5kbGluZyBvZiBpbnRl
cmZlcmVuY2VzCj4gZHVlIHRvIGluY3VtYmVudCBzaWduYWxzIGluIDYgR0h6IGNoYW5uZWxzLiBX
aGVuIGFuIGludGVyZmVyZW5jZSBpcwo+IGRldGVjdGVkLCB0aGUgZmlybXdhcmUgaW5kaWNhdGVz
IGl0IHRvIHRoZSBob3N0IHVzaW5nIHRoZQo+IFdNSV9EQ1NfSU5URVJGRVJFTkNFX0VWRU5ULgo+
IAo+IFRoZSBkcml2ZXIgaXMgZXhwZWN0ZWQgdG8gcGFyc2UgdGhlIG5ldyBXTUkgZXZlbnQgdG8g
cmV0cmlldmUgdGhlCj4gaW50ZXJmZXJlbmNlIGluZm9ybWF0aW9uLCB2YWxpZGF0ZSB0aGUgaW50
ZXJmZXJlbmNlIGRldGVjdGVkIGNoYW5uZWwgYW5kCj4gYml0bWFwLCBhbmQgaW5kaWNhdGUgdGhl
IGludGVyZmVyZW5jZSB0byBtYWM4MDIxMSwgd2hpY2ggdGhlbiBub3RpZmllcwo+IHRoaXMgaW50
ZXJmZXJlbmNlIHRvIHRoZSB1c2Vyc3BhY2UuCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAgICAg
LSBBZGRlZCBhbiBleHBsaWNpdCBsZW4gY2hlY2sgaW4gc3ViLVRMViBwYXJzZXIgYmVmb3JlIGFj
Y2Vzc2luZyBpbmZvLgo+IC0tLQo+IEFpc2h3YXJ5YSBSICgyKToKPiAgIHdpZmk6IGF0aDEyazog
QWRkIHN1cHBvcnQgZm9yIGhhbmRsaW5nIGluY3VtYmVudCBzaWduYWwgaW50ZXJmZXJlbmNlCj4g
ICAgIGluIDYgR0h6Cj4gICB3aWZpOiBhdGgxMms6IEFkZCBkZWJ1Z2ZzIHN1cHBvcnQgdG8gc2lt
dWxhdGUgaW5jdW1iZW50IHNpZ25hbAo+ICAgICBpbnRlcmZlcmVuY2UKPiAKPiAgZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9jb3JlLmggICAgfCAgIDggKwo+ICBkcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTJrL2RlYnVnZnMuYyB8ICA0NiArKysKPiAgZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEyay9tYWMuYyAgICAgfCAgNDYgKysrCj4gIGRyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMmsvd21pLmMgICAgIHwgNDI1ICsrKysrKysrKysrKysrKysrKysrKysKPiAg
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay93bWkuaCAgICAgfCAgNzIgKysrLQo+ICA1
IGZpbGVzIGNoYW5nZWQsIDU5NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gCj4g
YmFzZS1jb21taXQ6IGUxMmQyZDM5ODNhY2IxNTBmZDk4N2QxOWVjNmEyYTUzMGRhMTEwZGYKClJl
dmlld2VkLWJ5OiBCYW9jaGVuIFFpYW5nIDxiYW9jaGVuLnFpYW5nQG9zcy5xdWFsY29tbS5jb20+
Cgo+IC0tIAo+IDIuMzQuMQ==

