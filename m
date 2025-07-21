Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38029C83F25
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpWXbETewfbjKdm/uesf4U6sOxQjAz10hl/r+X1ya68=; b=zrPaztCd0yIHeMcVYFar0kfk0b
	BArROXziYrWJHVcy0MHPuefGzXe2BwkdP/vuOQBupMf8BwWgixByR545PXmbfzIK9S63QhaTr4mvz
	bCXdqM01j4zh19IjxClEd4E6dTFHtcM29JnxFH14m6J8lRxgfc6zCI90EgstmAkxcAqwxUJ6LRecw
	Af8MmXZ1RaYt4+aSKx8BzxHZfh2TwvXXVW+e7ZorVanfM6B4IW8Auee0ASY99bHDHiZB4buiq+jWB
	04zwVLatfNgdQOa9dBIoRCyvENy34kf7q+qCiv7ZdFjEfU11Rx/gyuJncE8fwsuubIClscc/qAoiZ
	/L2AHwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyES-00000000kfs-48BP;
	Mon, 21 Jul 2025 21:39:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyC0-00000000kCU-2wOu
	for ath12k@lists.infradead.org;
	Mon, 21 Jul 2025 21:37:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LH1w9j015983
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpWXbETewfbjKdm/uesf4U6sOxQjAz10hl/r+X1ya68=; b=flpSvoJQUeUGunIB
	A6gzfI9CR0ERvd1RfN/fPXGA8hw6hYO1uGiY+JNZyvdW5wlgFnV8Wfk7kBHMlGg8
	Yor4m5XfY6n4KJKFGM+KmWqHfC70wCuZBR9+NZTrBD7GTj8gOUDPVXDNLJ2YKjD8
	nuGIyCpitDDZsoXSxxmglNYQAkeLZ3x5z0oty7xZ4xmfYJWjOXmKRyvSXC2AVPJi
	TDMthvACz2D+mD4OyMDN8EbDxh0Jtwo4MR37ac20DPQEIJpNLukoPCtvATX1W0st
	H14PQj1Y3LJQO2mcaZAP73RTp7L6KC6SQwNyH7Snylbu18j8PSaM1d/2bxpSVKQo
	DWu+sg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451f3uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748fd21468cso4212279b3a.1
        for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 14:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753133822; x=1753738622;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpWXbETewfbjKdm/uesf4U6sOxQjAz10hl/r+X1ya68=;
        b=G1/KoqViom9gLPIGKnDm57A/fXSubT0mX1Ytx1RCzd5rdxeUt0IpTO8Lff7eiARpS4
         FNQD75jDfnDVIhYD4fLzi0l68I6ATcMGFTXzbDFVWpRU/OKZAYUvpv/LBwDJqPz1/3g2
         +A4yux3fWRiJ5h4XkPxxb0Dg2Z4xPeOyQcBHyN43cikyrLVVOGp/gMn5kJaYBoc7Li0A
         RWtQcjVuDCPC1DRpLQYDC6cRr9EuU408H8Rte+F+vpvCZ+uvhbOI2YaaGNKs2RwQ8OLi
         kaX/q1H670IMi+/RuhXcIRm8Wvxh0bg5nQIKl0MW496bgnEVPwGLuM4qUQ65LwXYo1dY
         zkaw==
X-Gm-Message-State: AOJu0Yy1jy3JQUF0VK+LtKu6Z72AGTD+XFdpNDlhrbrGNN+Zl3W3u7nI
	9Pbtp2u2D80lBSJG+QbJr9JPBV9tXKPv/BsJ0nrmXgL2+cuPKNdjQtfsM0tkKSWdU4rRteGP1qJ
	g2zjcY6b0/gKCrSp0N79dSUyo+SaGf8YocfwTA9EaxKBc/QsX0/Lxl75X1DxpYukD
X-Gm-Gg: ASbGnctPd8FvQJyGFPXZoTDIhhueR877vmLZjXeegXWjKkix6PtTPlQdIBEjvv1lKvd
	U/yxTISjgCz0gbdCU9Gmv0w0ts6h7qkzndMhtnk4aU3FeWADKd+zHYAu+gQrUCtn8Kw6P62Wdyd
	DpcWxbvKNW2JBPsohMdjdMMk41ol5Mkom5CV2DJSqJyoedgSozidFCD/tvFI2O3aXPWaJfBvQW/
	WLza7tuW6t2J1CZUM0h5au+mzaehWZBX0WTx9lqtl2jaOUlf2mbclBVG9u4C1WJzwNtRspUbpVU
	uGXxCD9O7g/0EX8DVfUMsnP0DbDuFRTAdPMr18gbUmCrqQnmwXDDC+wylbZY527l+9az/OGTitF
	s
X-Received: by 2002:a05:6a00:1410:b0:748:f41d:69d2 with SMTP id d2e1a72fcca58-756e7acfa48mr32771117b3a.4.1753133822339;
        Mon, 21 Jul 2025 14:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPUG2SMRJgY+/lzdESBOLJ/M6DzqEnQrb4E4X1LflHnB7zeYCzcFGFzGjBSw/owjRxRJ4aew==
X-Received: by 2002:a05:6a00:1410:b0:748:f41d:69d2 with SMTP id d2e1a72fcca58-756e7acfa48mr32771086b3a.4.1753133821844;
        Mon, 21 Jul 2025 14:37:01 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68046sm6201934b3a.151.2025.07.21.14.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 14:37:01 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <quic_sarishar@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250721061749.886732-1-quic_sarishar@quicinc.com>
References: <20250721061749.886732-1-quic_sarishar@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Correct tid cleanup when tid
 setup fails
Message-Id: <175313382123.971667.15852637463136449839.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 14:37:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687eb2ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=grRxx7Cr2Ne4EJ9EsKUA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: l62YLZfoK9Nbj7qVRsh0Rj2Vh57Y3Z2V
X-Proofpoint-GUID: l62YLZfoK9Nbj7qVRsh0Rj2Vh57Y3Z2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5MiBTYWx0ZWRfXzZVxWgddcPcY
 NiCVWAyqOEbGL1kwtlkLHzp66i5k29QmdzGh840seW4PRKx4mZ/i2g2mOJiuuDg/NBvsE1m4/Jh
 MOuvaLJGo0H9FPcJhi+nOxf0nEIRCX0L82UYR3nyh5Exuii8lZ8XSCWFzFpcB61eY26akCDe8PK
 T6YZnbVl7T7mGCh0eQShieB7TraSNrbtjEt65EkagLr2/TIqdj1vCasB9FMCyBKHxD6SLGczTyD
 GGTQHDVOOHP6gFKOoZ2yaK8XtHyUbet79n9C8wzkLQhwHR6/BeP3gKizqq+pyKgc3wGpKLbK9kB
 Y8Xlgd6gv2dIoJ66cs102G2kNssS2blnfXsyMSwifVH1fy+UutGkMeI1VbUEofXpehO46vBR37f
 BcxJ8fQ3UYCpC3zLHvZGXgQrlj1v9+wB9poCR5SbD8cG1FWPDqrCI+5VmeIrACFLm0efhWd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=811 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_143704_861730_7D45DC43 
X-CRM114-Status: UNSURE (   9.93  )
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


On Mon, 21 Jul 2025 11:47:49 +0530, Sarika Sharma wrote:
> Currently, if any error occurs during ath12k_dp_rx_peer_tid_setup(),
> the tid value is already incremented, even though the corresponding
> TID is not actually allocated. Proceed to
> ath12k_dp_rx_peer_tid_delete() starting from unallocated tid,
> which might leads to freeing unallocated TID and cause potential
> crash or out-of-bounds access.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Correct tid cleanup when tid setup fails
      commit: 4a2bf707270f897ab8077baee8ed5842a5321686

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


