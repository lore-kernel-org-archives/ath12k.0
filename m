Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B7DCED242
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s+ezLTtzWkWD64tzndFcNBEwJ0x/KwCHp1AAUBTMZ4=; b=PyBdwwQaxJeyqIzi5k7jUA4W/a
	CAf3O/9q+VrmR2GxaJibRnAsSr8GL5VeCAmnMNvIrAylcdbxGR58vnyvoZMEs7fR9Yl8AETiW5sPc
	XXKGSLlJalS9+gXL+I7gEXLV6lwFJwX/D2v4wmO5ac4NwCf3cEv5xN2IQPtT8Th4kfX1N6H9h9oeR
	Jrlw0ObUkWIuyOFzXoUVsYMKSBh2pNKd2vSV8g0DApNT/612EftW0gs/dBX9NG3q/oDUcyh/M9+XV
	mlrXeci8FLeURLdpeRHzRa+aZNNb33M4FWF+DeDg8+Qr2uKjfnkdDYHZgkLkl2eQM2tH/LR2XmhWI
	7gXeXlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxvVe-00000003rHT-01IK
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 21:43:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxvVb-00000003rGX-0Fjv
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 21:43:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497E1okP032476;
	Mon, 7 Oct 2024 21:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+s+ezLTtzWkWD64tzndFcNBEwJ0x/KwCHp1AAUBTMZ4=; b=gs7vFJ6w9TJmYo+o
	Nq6PuzHxx56+5i5Y8E2FnVgtdqQImLkblO6WImVEgzXqKpu6Vrty1VlpbFJhIWwF
	7jKCI5I90DUhMSkxSN82P9gOCgcfkVnYZBxwEu0FDfqaq/CfgjXxZyCOaWRzrtA4
	UeCbWjcWWwkMifmW5XwSnF0dhPwr2LcuUVlz4skd4ejXVqigyHa1adJsA6jw+CCH
	5TUDIFlG1ghrmnzs1Mt6G5v+vh2HJ+nXwPb6IlXdW8LD0lgRru3D0J8zmRmv/+js
	TNkZ3WhlknqGAWjVjYpuK893DbFVcrkpKflLEmh/a9DieEdgmtggjUAAHKOgvTwI
	WDZFhw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv8dcpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 21:43:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497LhDDq030133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 21:43:13 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 14:43:12 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241004085915.1788951-1-quic_rdevanat@quicinc.com>
References: <20241004085915.1788951-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath12k: Modify print_array_to_buf() to
 support arrays with 1-based semantics
Message-ID: <172833739273.2581613.18143201251976678958.b4-ty@quicinc.com>
Date: Mon, 7 Oct 2024 14:43:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xrjqsasKux_IHq2G6hChfrVE9Vy29x-e
X-Proofpoint-GUID: xrjqsasKux_IHq2G6hChfrVE9Vy29x-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=494 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_144315_212639_072718AB 
X-CRM114-Status: GOOD (  10.28  )
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


On Fri, 04 Oct 2024 14:29:15 +0530, Roopni Devanathan wrote:
> The API print_array_to_buf() currently supports printing
> arrays with 0 indexing. In some cases, a few arrays need
> to be printed with 1-based indexing, i.e., array should be
> printed, starting with 1.
> 
> Add a new version of print_array_to_buf(), named
> print_array_to_buf_index(), which implements the functionality
> of print_array_to_index(), but with an extra variable, pointing
> to the index starting with which the array should be printed.
> Modify print_array_to_buf() to call
> print_array_to_buf_index() with 0 as the starting index.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
      commit: e985dc55029707b7019819d570bae4225effd2e4

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


