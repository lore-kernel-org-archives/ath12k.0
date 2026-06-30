Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0580BC43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hM/2xLiVBIEn097bAk1PtclBiyah9Mcg79Um1wYelx0=; b=ehHBQ7K58QDXUe4TDmSlK7E3OO
	InUWVRi447m0USFBbJ5CxgobYQEMiYGsrKNKLj1isKjBnu+rlAf+lO6TE99upi4JLZsMuM7Y10B5l
	wRytYX50eZM7RrHJbvCDIFNz2R8Yt03z2ZTAf+/60xEoDwEyiHhqMBdBOnu9fzoOGvd3epCua4v8L
	HiJKHQwR/1c8TxYsfZoPSB0bul1WDhKRtzhrkqr2KK+yA+rMiwU6mDo6YUf10iHKWJJmDgaCj7O0h
	8d07ccK9Rru5biQY9Fv3wJ/E5IdqgCzyxcbLk/MChPBea36jzhVhXVMQuw9FuzkNHVuFiQbv/s7D+
	XwoPzMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyx-00000000F46-2wLy;
	Tue, 30 Jun 2026 21:27:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyX-00000000Eov-0l9y
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDYol2881369
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hM/2xLiVBIEn097bAk1PtclBiyah9Mcg79Um1wYelx0=; b=D+lMPPWMfUrzeapI
	f13fuvmI26a4UZRHFAE24hPO+4KQCsTfde+LP91POTt0s2Qa+byEA57TS6ICF0GS
	s1zVUndS2hyCH/nTyxEuETuGNBzJMvSB0vTFybcx3nQlTIYVyGnc+gQ3tQpitle2
	deobrpouFOeWEbLNaszeyTtq2u56b1HkbRrOlhk0eTGGHQCD6SOYKeUraafN9ipu
	W68EWIaVPPc424cB0X0lQFyf4a21+knp1lYf4EAKS4y5n2Det6+LOvGC0poHxbhc
	NH3YfTKZ7TYl920ptpHgqHr8szyt1eef5AfuyrVdxmDnznpQQWvm/2IjuDJc+44q
	bOZuyg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqgtba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ba395b047so332367eec.0
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854796; x=1783459596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM/2xLiVBIEn097bAk1PtclBiyah9Mcg79Um1wYelx0=;
        b=AhQokflMTpUsxOWurgKQp60sshvPZlnU7qQdQ8xJbDDX07MM5zahHRg7HluaM4fZBB
         LWnpTmLAnt+7wF/QnvGlXCnB7S9utEVKUe7C70H8Lupr/7NJ1Ra2EZKrBh+BhLuR0gqN
         FRhAi6X+4vV95Hvoc1CI0Srk5+br/GOfFFNlubwm2rQo+0ONzAr5jSliBrnbbTdlhJB4
         iMNdXs10/XufpYqnK7vTQjyPbJWFRh2ZwMM/3BDnJvzCgbt2HSELBixK4W6+Sli1GybL
         li04Hoy3BBhn5wOGN2nXD+MVrasVyd5xLDC5E2jjrrflkyJpR8qdbkBa2nc+kyqucjwE
         cLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854796; x=1783459596;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hM/2xLiVBIEn097bAk1PtclBiyah9Mcg79Um1wYelx0=;
        b=Sfj42fdnuAyuj9m5ATEPFDRL56WcnsRidZ4r3CGbn4NaroTOJ78QzmLB0313lahJmy
         2hCKkmNV//aQku+vuMpKZlYSoWZ5lvZd9VId4IPSB6HUy+BUMbEv1rbSooxf+MhqUGZv
         Z5+s4P9VeL+/CKDOJVyfdKDMJIqN57gnECPj26kkgK1B2nwc4CeUCg9+x/WQs47Xvum7
         tloalWFUY+rj5D5twmLLAlst7S4kX64WLoIeY0fyWzghwzSnv/2BTVvk7cHG2zUxYoOh
         SH32uGHDMQEJSu6xviCHETNDr3S764on1JN2VxlKJBqNXz0Hz9EaGN4QKDyvkt9+wKW9
         S+Yg==
X-Gm-Message-State: AOJu0YxlgShXnw7cTvN0r/KFwjHmOiiLhbAVJG8FTXDaYYb6JMi1AAl9
	YQOWb9fl422uXJ2WBGS/D1uqJ/QFXHymtJ/RRIdzpqIVYk+2PQ2QlQ9pgNWSXNnLl/4RNOsqcYj
	ENM1GaxNvdCj9PwOh52coIXYWS+/I0JRwfP6kDZWfeafd65MCPokIBYWvg28TlCoZ
X-Gm-Gg: AfdE7cm8Okao2IB0X2sT38N8Dn6OruF7XZvRlDLhRpn5CKYFCqxJL0c2Eu2JlUWCcdk
	ytfPO+i0Zbru/BywInHbUZFHmoqy+TxbhTTvOr8GnWMKOYnWauncob1kG05+tCiNiw14E1ThYqV
	i02Avqk0oiGXQSwxz96xukLbgzOzE90sIRBX5fTSyTdIzxA3tw70F9CASMvSK+eiVovWbCF78/y
	AVIrCkERAD5vMbeJrNkvXDi6FvAZygNKu72kVfvmwoOKMJYmtGBHUagwdJpKK4MJYxXR9L4qIV5
	zme6/XQf8kxRaDvDnDqr4oLnvdg/KQgoNhJxMnsPjOW7OX0weYAY/6Fs7ejooQgyFlsOp9FB+iA
	N00fJvZAcP9TNYXcgnzKX7sgb/AXckvdR9kvxIV2LUrnNPimXr5t3j2qI39RibmHCvw==
X-Received: by 2002:a05:7301:3d1a:b0:30c:ab4f:46be with SMTP id 5a478bee46e88-30ef09f0d93mr1671984eec.36.1782854796046;
        Tue, 30 Jun 2026 14:26:36 -0700 (PDT)
X-Received: by 2002:a05:7301:3d1a:b0:30c:ab4f:46be with SMTP id 5a478bee46e88-30ef09f0d93mr1671964eec.36.1782854795524;
        Tue, 30 Jun 2026 14:26:35 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:34 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>,
        Karthik M <karthik.m@oss.qualcomm.com>
In-Reply-To: <20260623-ieee_link_id-v2-1-8a89d71baf58@oss.qualcomm.com>
References: <20260623-ieee_link_id-v2-1-8a89d71baf58@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: advertise ieee_link_id in
 vdev start MLO params
Message-Id: <178285479396.1590147.1856151805627315095.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: BN6wWZ7jcZ7jqIpeR9WWkz6LN1U6vmh9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX4DfmWeuSHqo5
 UFrNixSXDYRMlFdjxR4HAvu92ABaaRCtkSW5TDn9+NhWKVG92sYH4Csks/OTW0BhZieWrMh38FQ
 5cfIBvOaZG0yNsIo6rT5hopz4UB+wPh4EFTptNbeucBVY5SF3CJj2JaqH1jkUE7CQHlUQbTxbTE
 a8i9Rg93n4ZkJ0Hsjx8xHj1aSahNVL8Pna0yisNXCMPyOr5ka/ah+XYAfegBqI0vEdESrnD7YVs
 +tAKlgrw+tK1iAcCVZpxacN6dgim5jg3hgzJ/ruNDsmgNziLWnGshVO/Wdj8B7SPi0ZgFr64/iv
 U7bmYtSnvEGmoCk8z7y+252STg0XGZUotqzffZl7wtfMJxX2zz7F2wbihgKNpl4J3JiHZZzHcCo
 klY4sbudefCwCqiKJWchKpmax0YHC96xC111ApZaXPR0Ca8Xtaa+KNm4T5GhlgsyIvpJwOmICLP
 QdVb6y7+3udZ+dczcAg==
X-Proofpoint-GUID: BN6wWZ7jcZ7jqIpeR9WWkz6LN1U6vmh9
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44348c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oIajaL2VPBg-BlUWyywA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX6Qso/iKeZ8VA
 s+0MR5pMwTqfo0O47MIzW9+fStAmpRkDP3hXQBz1MqNGXTb2iyj+ed4fEW1uTFYkoJmnhQaIBVm
 msuQsw6C2mbRRtBOoa41eVNJJM5pJGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142637_495651_64F535F8 
X-CRM114-Status: UNSURE (   9.39  )
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


On Tue, 23 Jun 2026 11:16:21 +0530, Manish Dharanenthiran wrote:
> Firmware builds the AP MLD partner profile from the hw_link_id passed in
> the vdev start parameters. However, hw_link_id is not always the same as
> the logical per-MLD ieee_link_id, since ieee_link_id is assigned per MLD
> and not per pdev.
> 
> This matters in mixed MLO and SLO setups. For example:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: advertise ieee_link_id in vdev start MLO params
      commit: 784f7dabf5d3bce23c69c48a0441ff2b1536f069

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


