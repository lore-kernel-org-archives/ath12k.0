Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A47CD2A528
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkYpEXlfj4Z6HJa3arUdRA+ROLVOZ5ZsObOtV23Aa0k=; b=me1SaFpQycuawrTR5lL9AdfziJ
	ecF9kElGusMOSEeUalR8nQvqfTo8QVAjtMaiT2N6BQMF0FxMMnAi0xdgMCZ8z6QVEsTZcWhJVwmDQ
	WXYq3PJMrNQuGjMynJtIYWTSnhkudSFVEt4+sWodmAqhu85FRK7xj26CrNfTY91mF2rQXUea9QreR
	aR7HJKBRK6bKKt5e3HDUPyXYM3jp9GTBawpb6ZtansI1FNlD0Hh/99miqDz7Yf1+pdl0thO1nkSoZ
	ZbNNcvklG5M2He6ZhfmQINsL5dr+kjjACcgF0V5mrfpzchm26H5gPRjmC3tTrIYexrvMhwRWr95JU
	/NmwlvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15oW-0000000CDpY-0FEB
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 15:19:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15mh-0000000CDWK-3Zp4
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 15:18:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAI2EN011275;
	Wed, 16 Oct 2024 15:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkYpEXlfj4Z6HJa3arUdRA+ROLVOZ5ZsObOtV23Aa0k=; b=H0zRJLqF6WgtpFOV
	Kzx64TrGfgf29nBHj0f4MGa7XMx1iKBuyhwJzA9SIT9ORBF77a7RNtztb59Ae6II
	uqDS9gRFMBZwoYgTg8ajy6ljeCF5ys2AIPGX3h8eE1mKpuNIxz0dcSXNM2ipqFYJ
	B0zaFwNY8DM1Dl6PP0BHS3Xv5BDpU8muz2CeCLbGSccR/+C2tM4Dyc4O2rN0d6Nf
	yKkOJJWNQrrQ4aM8IBqiZiDnkSXQ41X6/HNBERS0BF7vaiWZIKT+oR3GPXoYM1aq
	DsK0VYzhk1HC4hJrz3LFVaBLC5IlGPEg1Pa3/P9z8CbVJv8smEYP/uWn8yJh9I8b
	E8xvgQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5h0v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFHvFp028670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:57 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 08:17:57 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241014070610.3982173-1-quic_rdevanat@quicinc.com>
References: <20241014070610.3982173-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v3 0/2] wifi: ath12k: Support pdev Rate, Scheduled
 Algorithm Stats
Message-ID: <172909187738.412681.6151951796339627946.b4-ty@quicinc.com>
Date: Wed, 16 Oct 2024 08:17:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Y7w3tt4ZoTO46yOTWh0hO0l2piVMV245
X-Proofpoint-GUID: Y7w3tt4ZoTO46yOTWh0hO0l2piVMV245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=640 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_081800_048977_47EA08EE 
X-CRM114-Status: UNSURE (   6.96  )
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


On Mon, 14 Oct 2024 12:36:08 +0530, Roopni Devanathan wrote:
> Add support to request HTT stats type 49 and 51 from firmware. These
> stats give scheduled algorithm stats and BE OFDMA rate of pdev, respectively.
> 
> v3:
>  - Updated dependencies.
> v2:
>  - Modified the API print_array_to_buf_v2() to print_array_to_buf_index().
>  - Updated dependencies.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Support Pdev Scheduled Algorithm Stats
      commit: 9fa60c6d40599dfb788a1cafdef9a1c464a95b7d
[2/2] wifi: ath12k: Support BE OFDMA Pdev Rate Stats
      commit: 25ff1ae52139b53c1a69f55ce235077528245b55

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


