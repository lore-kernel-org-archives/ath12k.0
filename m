Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F419D597C2
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 01:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bbd3U3/kb+UHiB2b7mf/WFn3/vSnGPGUueA8NvYkIUw=; b=s7ocz3JT6wKXh3i+CMHqCHeZOl
	/11Nn4fEldqItjwZJXcuzL77f8Cru/5Zr/KXbdAVPHPnZWTJWPpWQ84lIEuEITPg7wnw9BOl4Gb+m
	iAvuQJdbZWi5bYCOrD8eJQUkR1oxkLGe0JArOSPpY1z3UCxrVRrlCIR47sBuWasFvpA2Bm9R1nOcG
	IFfrXF5f1qcHF/Jp2J4jGYxPseApR3vqC2dzzrlvsadrc36S+YUcHaZDseiamGl3nGGV5+kkHCc2D
	D1tnRxGh9ntX6aBdMx0mc2Kbm3mULTm6TvzOKKOSEGmZDUw9+qTYpIPH0hgs1zCIpyV/h/D3DMl3p
	qTvWu9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB1lU-00000005TKz-3WEB
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 01:01:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB1lR-00000005TKF-2Msr
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 01:01:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRUNr019976;
	Wed, 13 Nov 2024 01:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bbd3U3/kb+UHiB2b7mf/WFn3/vSnGPGUueA8NvYkIUw=; b=Wpj9VHHRhk9gyeSL
	I6vFWRMQCL8AphYNgG/egAuTTpDj5rGhXaKWUyJXZu3AfRySwZ0BvjgyzpP/OQDw
	6qxRPkCN2ASmu6GeZBWMdVVlLqXQk43qzMLRwQ5ZOFqxOY7kIFEmprSdxjV0/3pa
	7VFnoyPrepA3YJj6y5VEshMKg/E8XPAv32yEUclWUesc4hkTi897EWnOe2AJd4X9
	K+r/Xxre0d8LGh3bT8WMlhm+86Aa3F7gHtkwjzn4GTVrDlgYi4GGQ8x/UgknJtK5
	oNGBdGNMsZkxKxUOkz0nDwjezZyMIuGYg/aKcAxzgN3M/0zwcE/hOZbUVDf+oF09
	8tBUaw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uc60dr5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:01:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD11dOT023708
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:01:39 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 17:01:39 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <kvalo@kernel.org>, <jjohnson@kernel.org>,
        Karol Przybylski
	<karprzy7@gmail.com>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>
In-Reply-To: <20241105101132.374372-1-karprzy7@gmail.com>
References: <20241105101132.374372-1-karprzy7@gmail.com>
Subject: Re: [PATCH v3] wifi: ath12k: Fix for out-of bound access error
Message-ID: <173145969935.2685813.8639859936545662512.b4-ty@quicinc.com>
Date: Tue, 12 Nov 2024 17:01:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NNq5O9uB3nIrmpp69lxQwJqNMcdp1wxM
X-Proofpoint-ORIG-GUID: NNq5O9uB3nIrmpp69lxQwJqNMcdp1wxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxlogscore=647 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_170145_753874_21F6E5B4 
X-CRM114-Status: UNSURE (   6.98  )
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


On Tue, 05 Nov 2024 11:11:31 +0100, Karol Przybylski wrote:
> Selfgen stats are placed in a buffer using print_array_to_buf_index() function.
> Array length parameter passed to the function is too big, resulting in possible
> out-of bound memory error.
> Decreasing buffer size by one fixes faulty upper bound of passed array.
> 
> Discovered in coverity scan, CID 1600742 and CID 1600758
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix for out-of bound access error
      commit: eb8c0534713865d190856f10bfc97cf0b88475b1

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


