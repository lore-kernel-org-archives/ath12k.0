Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7CE60A2600
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vqRD+T0i;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ex1FqCrj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXufxYJS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BeTEhGBfYlD9cDqILYsPLDxJJwupE/RtKan/yHzEftY=; b=vqRD+T0iH/aZd1
	TPH0U5teJ2cp26+/FnsUMyoXYwFCynRQjEM6lmQmvResbBzoHHgp8ZCdg85tHOdhfu6+u2/hyiIUL
	hrTZelikOrFHceo9y+H5yWzp0d8dReTpIpZt0nC4VcF7StGBCptgns5HMzoZ1Ozoy/jftHBfqoWxV
	AGxOKcIA1lKtOYqBP9H+JUj8zYjarU6sEXGDuXpFwBm5rKo2rdTAtQhZ3h5+Bu8CLfZ4yCNVbGwhT
	oztQFPBS6d+nP8Vo6yoqFBbVZ/U9/ei4weXwbLvUMbxhRx90i0w9f2PN+EsapVDi8vC98wp23AzZv
	ocodeTNKkXge9E9gpmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0z-00000009eaa-0qC4;
	Wed, 18 Nov 2026 17:00:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0v-00000009eXc-3rrQ
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwluB200125
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeTEhGBfYlD9cDqILYsPLDxJJwupE/RtKan/yHzEftY=; b=ex1FqCrj5L0rv98a
	ZMrSIkJm6WgX4kPcLxCONcBGbHdoT5SC/JEolzVobJZucKT4njNMndQlbHaPvf/u
	2TWqIpujpqCbSNQGXZKw7kCfKYfORrFfcgUefdroLXFdEUAQtZ+HMCCng7s3EEO8
	choiVHwEKs113poT4duXblh4VuQvrruf8iHfVScHBwceA2+NjYXxsdvZglW3cQRL
	lStayErWKRCO+NR047zRfdwG7fQulaZKv+YPeJMTDDRepfHJqHJIC3YA7xmTiTLR
	nH/fpv//3qmlD/iJgZShfiFbIQ/JhZpHXdE+lVF3x7zZBYtq5h3RyUdp4k3AkStj
	03IJIA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9c6sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso1488eec.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021201; x=1795626001; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeTEhGBfYlD9cDqILYsPLDxJJwupE/RtKan/yHzEftY=;
        b=IXufxYJSP93aTBeR5u4eEemRMlQu9s2udOAhr+IQSpxdfjoqJ8jRHUnjUPdS4R4t7t
         /bC8u1Vi2txfOpV3rRlMxIpziKAXTMGMPF1cCvLLyqucagt8dL/oxEoDIR9ne17A/YJb
         V8cr0NAan4KmiU+rduxqM7+gJoiiw/JqiG2M4Ad0kVyHN6jaQUCETSWGz4pJw96af+e0
         b9y4HLSbqT6gGNA4OJe5SfRhBkwLG9SLMfiY2R4+mGPgWKVxm+Jm24TYG+Sb+MJan+iL
         mUCPac7y92HrhR46UnrYn2PX6LoG0X6L3jDaTqXRZY9IEIxsbUs040OmzT1+SRNfE8zs
         TwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021201; x=1795626001;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeTEhGBfYlD9cDqILYsPLDxJJwupE/RtKan/yHzEftY=;
        b=dHRjAnfCGf3NCNvgiBadXtmRG2lAONdC/7myZg0kPd6fWZOP7tbNhiRSSryopLeBuW
         SetTlg7Pj7+9snm1ZuGNY1+sly2Na+ZSHRuvZKHa2/GxL6xyDGgL17e6XiCwkdsMYasG
         il0d5ewjOtUJhQjBn7aRSBAtA55mpU8K9e84FmSY/krK0dw+9WzpYG72ZaBA5l+tMyVj
         WYmPS4E+Ja4IjfZnCe2q9szUtA5IgtmfqmJ9iZxO0wvrsC38+WudCpimuzTkE3ubst6T
         B+lFY5dE/EG1DCuZ2lWznsU5qCXECoR/36/cHIgV8TRnJGjibPh3eJRUU9TEKorcYlNC
         TSOA==
X-Gm-Message-State: APuU4Z/mVzE4hLGUAQceRGg3Y9V28IqfSojtg2bM0UBu/7+yojHkSOGq
	H+OTUkA7pAVRnOCigOBKMNezQ7oHndM4Owkj7P9gGbUWRFyzZAy+0FUVwta49oV2ORaZIgJhrRK
	j3M//VzzY6FxHwBNOzKU9EcrlQQzuKxGTinhLrGrBfVQ/zvFIVseDdDm/6A+Bo/s+ixhbuqFg
X-Gm-Gg: AYBFou3tEIBJQXSPKgyILGCf83Sl5M6DUM5pwVmFXgDcxC2fvAySnalcLN9zc5vRb64
	37KB+ybOISEBCNRPx83uy3ZAqsYbeb2fAurDvGSDgg6cBxVtfafRWOFX/R/wa7MhrYgI/T11pML
	Lkuld/qygL07aeU0O+2RjokQE1WC25GcJ681Ey4Gy9Wfiv5IG+0qZ5DLSLZ+/B884vG8t9+tNBY
	J/4KkxD4X6Ot/XJybgkAxBLRqaI5mXtzO+XuHPnClw18jP2+RqrcCkDBa/7gkycRuuSEQFY3p+V
	F3jBvnLlrvV/m6oxOptFRQSB7fC0kjL6RzAm2dS1R7l//xxObh49ZzK96BW8DljkEfEUTH/iRpo
	Y41k1NQGmz9oSho4n5oYiJj99K+shfTcfoRlhNtM5Iw0lqBF8LWo2aKsIyMvd2biELIlnwLJOlB
	4bisoSvvDS8ka2xlQr5gdvcsM5Pdhz
X-Received: by 2002:a05:701b:450a:20b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1b54cada9femr61018c88.12.1795021200419;
        Wed, 18 Nov 2026 09:00:00 -0800 (PST)
X-Received: by 2002:a05:701b:450a:20b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1b54cada9femr60704c88.12.1795021191745;
        Wed, 18 Nov 2026 08:59:51 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.08.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:59:51 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20261117-emailupdate-v1-1-38c7747cea11@oss.qualcomm.com>
References: <20261117-emailupdate-v1-1-38c7747cea11@oss.qualcomm.com>
Subject: Re: [PATCH] mailmap: add entry for Kang Yang
Message-Id: <179502119106.3425953.504708200004615067.b4-ty@b4>
Date: Wed, 18 Nov 2026 08:59:51 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX3/jfuIpFIyJX
 Xhx9T2x6+qKznKAOIudeB+L4XiKnd17kmfQEnVL9XCD9bseW7La+z3JmjGeQZerQ43cKBgeQIxV
 k3oWjxQJDvSc970iQ8fR7+LRydHCyBQ=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afdd995 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX3sp04YKhc6UF
 8TZG5B92XFpRvkzrKQO0cip6drcrhfwDhGjmjbx7FJ5AZ1DjJgXiEBGOb10Hdkmybr0ewGLGpoK
 8T43I/HkjHb3Y+6JMdHyyO/G6Js9WJWG2c0yaJUCgpIGsQ8NHyPWJuoXvb0tqE+ubAe8GCG2hai
 pMPtQjop08mwMxiGhvM7eM2HGNrVvnFyWC9OTpwfKI/Mxhn7DSKWqBXCse7xBx9uuQwetOTFD7Q
 Ny8mehMGQfj35mHgjuzg6PLCHnde231sZT1qPaDkcu8eybbCeFxAgt9tykGtDyS4/BnJFUg4o6m
 KsSd6ttpFYKXRc33m3GWRCPgGpJXBrKA354Hqdy2e3qEnETj4kxcx3uYS0vN/3DUZfSi3aTo/1c
 EWNl3r+45mzProYWnHPGyFhTY5frJumfpJmhyL06SIh0906Jb00WZ6oKEvNyJ4opuvhdURbrDAi
 hJLmPAJGxREmG2Qr0Rw==
X-Proofpoint-ORIG-GUID: P7KafchsvkepMqu3pPq29wovy2EExYQp
X-Proofpoint-GUID: P7KafchsvkepMqu3pPq29wovy2EExYQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090006_107192_3ED6EFAC 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 17 Nov 2026 18:31:38 -0800, Kang Yang wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] mailmap: add entry for Kang Yang
      commit: 5da95faa8f8a40dbc6b9a4d3651b567e7ad64139

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


