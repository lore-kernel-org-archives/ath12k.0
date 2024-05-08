Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437E3C19F4F
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1R0YHWRIbid3UatuffJOb2wb1+ZWpN0IrHIGT83GgxY=; b=SEgaIx132UYHCVFSuzPMa7/78J
	3bRHg8RRYU5QZVKEzq98zwYW43wqPRxW6u1HmWMVJSQheSuEkpp7hSAyizQQYN6VqbE47J8X2jZnG
	+ijYioMjG0Do31O1LTBch6Hcn+pGROoVugAf9kfbEC5IzKJLxIuEe9y8O16mmCNMDlccbXm1VQfUa
	QTEfNb9WF8e9noc5KYbgHg0kTlNVEpChhBsUtA1aZQAiDzU6TfuE9KEbG5nlevkwGYeTym0DXOMjA
	zkCQfhoV6DpTTcyFeAEEx+Cq787h1VzFFq/hVXYab7EPVVYztXhCiR9e8uz8mkH664oCETg4yI5kR
	wkQ5mgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kW7-0000000GEfF-2YTw
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 16:51:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kW4-0000000GEe7-06Gv
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 16:51:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448AeMZY006086;
	Wed, 8 May 2024 16:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1R0YHWRIbid3UatuffJOb2wb1+ZWpN0IrHIGT83GgxY=; b=dc
	wqOH04RFfmTt94Lczc01X+qLyxNER9rpuB2zVlKU6BhVXumLcV3vHTGSQUJ2Z1Ca
	rBd37RpUebQgKIwZupw50k4sqEOp+3aFiTFDonRF4BkKBsdsFcr1A9uskykxIz3t
	Q8OqhPqeLFXv9QwodwwuX7RuBKexxYVYKFS1AAC4la7FeXsUCKhw1/r8fibnNBr6
	HAx8ayeBFGQ4t7qzXtcvszVxoAtJ+uPCQPeOkbIcQO6XDqpVvAXaDFbj1ioBrAWH
	fVVPuIjqnQag32lFdMv1KjFTH2Zm16Sdv6iMGqslzxJLSlDRbr9wuyBoTOXXU6Cf
	p6wFkUFl3j93+pJyqzoA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u8rv7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 16:51:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448GpYOm005717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 16:51:34 GMT
Received: from [10.110.84.74] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 09:51:33 -0700
Message-ID: <1abbdd0c-d4cf-4e24-9b68-d732b07300ff@quicinc.com>
Date: Wed, 8 May 2024 09:51:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] wifi: ath12k: flush all packets before suspend
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, <quic_bqiang@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <7a96ca11-80b5-4751-8cfc-fa637f3aa63a@moroto.mountain>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <7a96ca11-80b5-4751-8cfc-fa637f3aa63a@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 39TB-UrMienNoIhDKQmKZG7RBB_KERC5
X-Proofpoint-ORIG-GUID: 39TB-UrMienNoIhDKQmKZG7RBB_KERC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=612 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_095140_225585_CC8367E2 
X-CRM114-Status: UNSURE (   6.28  )
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

On 5/8/2024 5:29 AM, Dan Carpenter wrote:
> Hello Baochen Qiang,
> 
> Commit 692921ead832 ("wifi: ath12k: flush all packets before
> suspend") from Apr 22, 2024 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/net/wireless/ath/ath12k/core.c:58 ath12k_core_suspend()
> 	warn: sleeping in atomic context

Hi Dan,
I'm not seeing this as part of my standard make W=1 C=1

What do I need to do in order to see this?
build_kernel_data.sh ??



