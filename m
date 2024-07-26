Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7F3C3DA49
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfklB0R9Y8l/WhmWGxJRvZsF0hUQx43qiR62ONI2yHc=; b=lP/aZ1r0Vn7CIhC2qgHSCyK00x
	Gmj4SHtHjPfxYGELJgLJ8nW/oNykJSYhdF8riMbw072J8x+L78pVNhr67ZAqbp5+K9dTyx5u7DOEw
	26atlomS+vn7jMXOwWYLelXFERUIU+KVRvbamH4tbQN1lw4fxgl853Wh7eKCw8sVLKwuPKSr2eAcq
	tJOcoTmpDxavj+tVFYo59hZXvu45tCgK2VK7/8BGq2tUfYlUNTewvnfiyrZ52U4BTcIAojMYBV11t
	aUoZgtUQ0jvaCrjeG/zYl/PAuAO94zIz3bUsGn8bWZAIJoJNtSavTjEBUc1J1O3wodaMveTq34bPe
	JHYefzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOMg-00000004UDk-2OUb
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 17:04:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOMd-00000004UDL-11dS
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 17:04:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QBsJKL023079;
	Fri, 26 Jul 2024 17:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BfklB0R9Y8l/WhmWGxJRvZsF0hUQx43qiR62ONI2yHc=; b=BRwFYJ6aTHCYt+2S
	LfkQGPyhudplo0y3JrICnQgZGcxKE0NbfIiUaRqrumw2vVPYVV83LOTE/d99YcYz
	VUcA8SnA9dAFgk5MZLppkrnnFhiFRfNOmFLCua6ZOzT6QLwvq8mtUSS8FIqc9emd
	uFlYaFz/GUuu/l3bkJiBoqCxjQp+egkNgMiOpquWFDflw47M0RRPihXTQdBfHDTf
	xAYQzjboMBASFlfrlZcETB2BtknUB6080zVV7OAbwGO1/NcQ2gZR4cE3jIgCFPHK
	OeIdDMG8wjwiYzeAOB7S+lHinUFkDqFYNkGMl4Et59LFJBri4kW7yzfs/2+lQXms
	aJKgcw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1sv214t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 17:04:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46QH4GYj001303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 17:04:16 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 10:04:15 -0700
Message-ID: <43f5cb3a-e601-4a13-a1bf-c89dcc0cff7b@quicinc.com>
Date: Fri, 26 Jul 2024 10:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] wifi: ath12k: delete mon reap timer
Content-Language: en-US
To: Ping-Ke Shih <pkshih@realtek.com>, kangyang <quic_kangyang@quicinc.com>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-12-quic_kangyang@quicinc.com>
 <2a44b24b-f122-44de-a053-fee07753eb7e@quicinc.com>
 <52318022dbe745da8b18892c26d78bec@realtek.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <52318022dbe745da8b18892c26d78bec@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2xt1GbjVCk1gyFfAAOu25hA207K7jzWb
X-Proofpoint-GUID: 2xt1GbjVCk1gyFfAAOu25hA207K7jzWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=485 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_100419_455502_89E039F0 
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

On 7/25/2024 6:57 PM, Ping-Ke Shih wrote:

> Not sure if you send out this mail incompletely. Lore [1] doesn't have complete
> message neither.
> 
> [1] https://lore.kernel.org/linux-wireless/2a44b24b-f122-44de-a053-fee07753eb7e@quicinc.com/T/#m1011a89113009a14c9d450dba31d8d11d36b5b6b

Thanks for catching this, now sent with my Acked-by properly added.


