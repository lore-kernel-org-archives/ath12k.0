Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B7EC2D0CD
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiNTa3xHUT48vXI9VZ1eFS1ze1mvvhYB3w0j4U0Yoa8=; b=Tkx35P2r2o597fwo0IgLFAoWqP
	TD6djJdrIzcq156Tx3bxKT7nX3EExe/AloaCNoJPfGllyaycZfSFleXzi+fN30G8r8FuAyZ04w2oZ
	cvOSTODFSKwAwqSe3Irh0A0xOZ8q6Orzij3JJY9fgC0e22odHxdBHwSXZIhUr+Psk+amD+Ti/voEc
	TZ6EoWZ3aEs0M/RJ1oD7b7fZZc16v1vk3xCEO4Qznv0Qwc4A8wLf7kjzF03XpFRqesLtsX2ArGHJm
	SuNqw1yB+GZOFoRFAN5+OYnmhayjo3R13fr9aKqwFlts7qtzkSgkv3u8K8/5uvCPSlljbbpB1hYBc
	dOWvPeyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56Z-0000000A7i1-2TzT;
	Mon, 19 May 2025 18:20:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4au-0000000A0tt-2tfe
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 17:48:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9a9GN030161
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KiNTa3xHUT48vXI9VZ1eFS1ze1mvvhYB3w0j4U0Yoa8=; b=dOTUzSK1npw4cYHI
	QPzsmwpPmOR6/A6wv2+VBPjIg653lf322w7Yf8nnIaVG/CAO1THDXbTdtvzCOcWC
	ozVc5onjQLC40GsdFGNBAHKDpQR1yBLXBTIXW+PfITadUXuY7khwEtpybOkIX3U/
	Q4DBuAHttaYCRRhj2uYT7w+QPhf+LipMyHCIQq0K9xgbvJLMQ/lp5MOiIjiTzG7E
	T5p6DF+iLodyYSy5sGfjR4uXIcWImQuVV5dA4BuJS5EAdv61BUzETEOawl0/pn8K
	cDjmnA9Jg2MlwgLhDUuiEerm9meSAQcj7w6zJ5RWyVn/jUu5rTnW2ZvsV6zphj4E
	WvcOcA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9w66w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-232054aa634so17987215ad.3
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 10:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676886; x=1748281686;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiNTa3xHUT48vXI9VZ1eFS1ze1mvvhYB3w0j4U0Yoa8=;
        b=YaWGmBktZh6dIxNxXVSLh0z7DVK9cRE0n8O8jELQYi3Ixz9UGVMKUe817/ADJQlIh8
         CCP+MOdx9swFCPGRxG7M2hkLXDgS/mNXK4FI0Z44e9MN/v/NTe+ZOtfCGeFui8aU55ih
         Lq5MlsNtRpZn8OoANLvCeE8jNJFgDaV476+9CT5KZNUNo3SgnIlT4s8RDiLtML7bJAs+
         Rxuc+kKidcBdO0jhNyh1rXv9Tx1wBZAs7DZ97h3nsqoDvVDwTWGS3QEM8Xo0uv3TNYn7
         3KgykA0NAW/kRTo7g15V/679Wwh1JqbpTd9umIbudgAu49jbdDNVqNp5QXL/hXta7VV9
         Zidw==
X-Gm-Message-State: AOJu0Yy5L5KIC34oInoHINNPdo7B2upUGvr/h6sfRdwaOBcbHNyBVFBi
	dJboG6nlQBNRywRFd43ZLO0ZTaNvZ2hcb3eZQZtvo4zAZJXT9XuhqwQ6Ie7Yj6A2Lq1dWeqdGsb
	WsWhfH5xMvj8kfOLZ835e+fYFXhsZ8PCWqUmkUNW8wadmW/nt1kzXm2mFQ01mNBOi
X-Gm-Gg: ASbGnctvtWZvq9wwT+i6GXB2zOatnCrqoUJ2BZX+I4Jbevbz5KFVLDyGoeB3mP+5wn0
	QTWmSST55j9xk9EYlRQX25E7590ZWMmRxxBk6rJ7cGnYW8MmPbolOiH52Mqcm9x22P96Amgo84c
	LbMzpuqLCQxF/NqtqrWNJwLd11RfoOD1KwCnGHil8H8WZ1756e5cfeRz9ux8g+LMObiX9I2BIzX
	XEmh4UR5OPyaNODIYy4YUdBO+XJoQ9sUOslTv0C3Z8kfhgU+ijqKIMlGScIyEy4+WN3pq5JVKaD
	VQrxVAGgyVl4Ncjf/5vVKLGhGcuuvgCjiD4N1JJJDEQzBdzc
X-Received: by 2002:a17:903:faf:b0:224:160d:3f5b with SMTP id d9443c01a7336-231de37ec9bmr167382525ad.49.1747676886207;
        Mon, 19 May 2025 10:48:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgkMNmycXWGcWfkPtYwBJCSYbSgtSw8y2jykqfsoWFfr3G2XDxdlJGqMqWmrSIqp4YAU9qog==
X-Received: by 2002:a17:903:faf:b0:224:160d:3f5b with SMTP id d9443c01a7336-231de37ec9bmr167382305ad.49.1747676885859;
        Mon, 19 May 2025 10:48:05 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:05 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Sowjanya vardhineni <quic_svardhin@quicinc.com>
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20250424055104.2503723-1-quic_svardhin@quicinc.com>
References: <20250424055104.2503723-1-quic_svardhin@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix invalid RSSI values in
 station dump
Message-Id: <174767688506.2567051.8725585393397940556.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:05 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: JFuOiOb_zj6SqpohZuS4l2bHseABwnax
X-Proofpoint-ORIG-GUID: JFuOiOb_zj6SqpohZuS4l2bHseABwnax
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b6ed7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pzwftTKYgEZDdG-AG3IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfX8JdM4vCdWgYF
 ZgTXsqAd/eNmcqU6UxH1RoiGrJUKp4/h6Afht5oOlc8yt4DEmdw337o/uxbnTMgmjWsSXGsTK4E
 Una2Xzu2FLn2U5i+HplLwoXrgi5EYFL7sQq10sS7VRt+/vJbe59ItXX9Wwl85ssEkhFkyXg9WKy
 ndCYGAt8tYMwvSnezZjPMdNyf+wT6Gj+QvlWbqns5U/7cgRfB9NDpisiK49jEC+jqqxBrdemV3a
 PKtDcC01ghf684iR0z2Xf41u74N1KJyfoJ/QfTEzwv9eJ/6XiWiGNYmCk58ZaHQS3N0NcedV4xz
 gAMZoEUD/R4nleb/j3xgLO8R5YzpI2q86LIUVRIx/8MgS4pyQkuOYXr/2oa19pftqICeK9GT575
 I7vSZdIAOkwZes+pX6R8jGG111VM8Hjct8hecanLXz4Xqh/qGFMMlwIe8wYYpdvqiF3Lwwf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=762 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104808_752800_C0D09D91 
X-CRM114-Status: GOOD (  11.49  )
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


On Thu, 24 Apr 2025 11:21:04 +0530, Sowjanya vardhineni wrote:
> When processing a "station dump" command, the driver retrieves RSSI
> values from the HAL_PHYRX_RSSI_LEGACY TLV received from the monitor
> destination ring, and reports them to userspace. Currently, the RSSI
> values reported are improper because the hardware has not been
> configured to update them properly.
> 
> To fix this, enable the HTT_RX_FILTER_TLV_FLAGS_PPDU_START_USER_INFO in
> the filter setup to ensure the correct RSSI values are returned in the
> HAL_PHYRX_RSSI_LEGACY TLV, resulting in correct RSSI values being
> reported to userspace.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix invalid RSSI values in station dump
      commit: 3126f1c52af5bc8d40d2c984907daeb501f6b739

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


