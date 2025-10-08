Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CF6CCA470
	for <ath12k@archiver.kernel.org>; Wed,  8 Oct 2025 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/Lh5vXes8BWGIZJc7F8+OO0nenf5hQxsJ1S9WXM38I=; b=g8pNnzcpl2wkp+C8Xojx4VHEmn
	DEWSMEcLH9ku9nX1XOYgz8OGv4q+UrdWv6If2v+OHjQPrLFtDJ+N2Y0qKcXzX/THMst7fpCM7VcOC
	Xq6MKRrcYFrOK1fdlrYOmyyFgBd2b4ANEMLo4uRchSZ5+ukhwj/PwzPPfWUxF3SJpUjHbo4Skez7W
	kX8suReDbWztYUX4O4wsi+CjvsJurLu+aMYw+EQ3bEjB5xDRbXJ/rZ9+JyLCEm3IXl65v83f9lGzK
	S4HIptguavnh/azddHOWkkgNndNx2V0+c11IETBer8IFm/++R9vKhQDNDvS35msg2CdL6O8GiGAzw
	8ARmAL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6X1R-00000004Ith-0weF;
	Wed, 08 Oct 2025 16:28:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6X1O-00000004Ise-2R6f
	for ath12k@lists.infradead.org;
	Wed, 08 Oct 2025 16:28:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Q0V026684
	for <ath12k@lists.infradead.org>; Wed, 8 Oct 2025 16:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/Lh5vXes8BWGIZJc7F8+OO0nenf5hQxsJ1S9WXM38I=; b=JPq2XO0swKej+68P
	OCu3FA3q8alhME6HQ8inmZ8q8HwIDYMWvsl4EvtUuTh52anIUPAEYesJeBmDyQLa
	9ziSf08zyvK6Pmn97W0+Saua96y7QnNNHUEJJI3iML9zXpDUolsIA9Dy4oDxigDA
	0irJqFYQNS7CIiM5GU8bhwdxpsVe8Te0OZHUVB31sCmSafTLgU2Ve65fsYjTKn6U
	ayCtxg0MUxodOBLJvSnvtnXNfEsH6tEUuDyZOFheEVJ3J0w0vQce/0Z5LDvID9bk
	xWJAoTxE0+wly/hG/FfM3Z6SrfKPOeAGcRReUNSsYtd0TofiQpmdg+pyd6QIqo6V
	UXwWTQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hk09t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 16:28:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78105c10afdso7179616b3a.1
        for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 09:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759940888; x=1760545688;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/Lh5vXes8BWGIZJc7F8+OO0nenf5hQxsJ1S9WXM38I=;
        b=k9AtaOspxautUmqB041qd460uXbqYrpYBJjqummyV9y7Gmu+1RZUiFqLecCtdt32dN
         nQq3XwuogORe6/Zt/2k3yccawfyeOjxiTh47oI2Wh+N0+rgJXATpYM2QKGMJoWjUoIwG
         T+r64sC6xiGJHgubLCRfEC4R8iAsSzg/GeGSDvJ4SkHEHkmdPlt+EspTCMrlEZagv7SV
         o9Tcsa1zZYc+wR8IC/9QbUtmnqoX2I5si1t/QjqeLG+JWM+uLxTAY2ixqa43J2BJy/zI
         QPz1IVmzvB18x1YpgQ7U2rSK2rKW9aJOoYXurR7aBhyvAsK0foFwHIKEIi6L34JGeSYm
         zbfg==
X-Gm-Message-State: AOJu0Yy2fhWQSMRTK4TZ8B3ZOZQEE0/1eJaUL3k5iG/PG33K5/mGkLVb
	4sWA/jwVhFcW09xxfuQDIJAW9zUa9IYf4dwNWJ5jTL1Kfwy5DLD6HwQgzuZ+mRo83kRSxEmF+82
	C4J5aH1gBiSTuOFAzKzl8EuNnlUah/zW2vD8vDOD/q3kAZLVx7Pa68M2Eex3qqZUsahpovwwk
X-Gm-Gg: ASbGncubfHgh1UPMVz91Ee3Klw3lXShW6BZdoszUfU70fGv7/A6Xfq6zIz3lwY+Ylih
	Y++61TjSUD6zpmUpAjsp0MtcAfRhBZbszn/OFKkjjt3XklrTdg0I93V85sXLTxgEbD+8S+ezs3K
	bTfMY1bK0Pa9vGRZDNZdjU1eG6wxuYyl2Wc/oVYa7bp0IhOI0v6jEtjmRs8mBQuiQ6fbbuVFSV4
	5SqshKkghQpZFS+gYhJccvV75gDM08qoTgO7sENx8VxVUXpfyqPp+ufCmkEmsMAjnpg+szLQIE/
	Uuzk23HCRPC1ZbEBhTpwgLuAjZOU0TxagqGt175pVCMp9fwnnQwGVoglZ568oxSSwG11X9jw61c
	2Ns7S/Q==
X-Received: by 2002:a05:6a00:92a2:b0:783:c2c4:9aa5 with SMTP id d2e1a72fcca58-79387d0f5aamr5801835b3a.32.1759940887525;
        Wed, 08 Oct 2025 09:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdpkirxIo87+yizG57TPPUjHz57MPqLEwoBEZBrybuU5QOQ06+d4WSXjU+s384HGdLO4g5Qg==
X-Received: by 2002:a05:6a00:92a2:b0:783:c2c4:9aa5 with SMTP id d2e1a72fcca58-79387d0f5aamr5801777b3a.32.1759940886823;
        Wed, 08 Oct 2025 09:28:06 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e33f0cb3sm156806b3a.78.2025.10.08.09.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:28:06 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251007110203.1541167-1-quic_rdeuri@quicinc.com>
References: <20251007110203.1541167-1-quic_rdeuri@quicinc.com>
Subject: Re: [PATCH ath12k-ng v2 0/2] wifi: ath12k: Modularization of PDEV
 object for Next Generation Driver
Message-Id: <175994088614.478288.1426868951079450309.b4-ty@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 09:28:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfX/Z70KvTJjeaU
 r2TvSpR/Ma+yrYcGxh2oeprDFLCYCH7HJ4eLImSQpCD6Bmi6wwdLwdwK7sz2geCWex+sFqyDYdu
 pWopX9pYuyLQo2cVdSiwtboHgrRAvc5Y6KYUhGHB5n23JXac7dogwh3kKTwuOBOV6o7lV9UDu+e
 Espy+r4FFvp1dxOCpn4X27JML2qP2CocfiMrSa+Xh956oZdKAiDnm3bKhV+QXsQQOFKpuGp8VXg
 J+/ZXT3pmPndjBxx5hSLxWcjhROdwu5KN2Ft0EXIXnavX9d6KBtQTwEUBDA7V9qZ7ukkJvBlcCO
 yYLvBu0IyttZ6E3bAgFEJTCjw2LLGlvy+uDTS1g9QF8AuoLCMojy4MYXpxHiGwE+TuWyERhQyNm
 K43ZnuM1e+YSa9ZHGKq89kQpeeXCrA==
X-Proofpoint-ORIG-GUID: znYWQTdck0ZjjGvo66Z7teqHgafdz4jZ
X-Proofpoint-GUID: znYWQTdck0ZjjGvo66Z7teqHgafdz4jZ
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e69118 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=B_2yNedsmjAXjeJ8S0MA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_092810_624336_7A1CE9B4 
X-CRM114-Status: GOOD (  10.24  )
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


On Tue, 07 Oct 2025 16:32:01 +0530, Ripan Deuri wrote:
> This patch series continues the effort to modularize data path structures
> in ath12k, focusing on improving the organization of DP pdev handling and
> preparing for future architecture-specific extensions.
> 
> Patch 1 refactors DP pdev handling by consolidating all DP-related fields
> of a radio into struct ath12k_pdev_dp structure. An RCU-protected array of
> these objects is introduced in ath12k_dp to facilitate dp_pdev lookup from
> ath12k_dp.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Refactor data path pdev struct
      commit: 9e0ee04f818f42ec879b053e4b5d0c9c230415da
[2/2] wifi: ath12k: Rearrange PPDU radio stats
      commit: c57176c0dad91a00bd20feb5f6dc4e8d575f4628

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


