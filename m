Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8460FC2BA15
	for <ath12k@archiver.kernel.org>; Tue, 18 Jun 2024 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfkYRWLpwrmj1akdvRqXCoaaWZ8G2kQWq2bWxnuP6rc=; b=FlLMdkWivPmha3qQRh24mIgvca
	kxT27orjkpTd77AUt9CsAuxaySS8MS5TFTWNhvr64VkNdxiI0GlKsRo68CoaP321FNQz3b1N+GHgw
	kF3kNRkFgZCcjZPCT7y0XnJt8jeKeJMik8n72BUYI9aEk+DQAp3Lfq8rlZtKmw4Rz3ULX2PlqebOq
	+81yRky7hrM3KMhhrTiyZHER88xZ7jBHNh6CmVRVdTXR2Izu46VFCwOeJD6/XvxOVJoJzZ5r5LQav
	enYjIDeStz8oABmeBqsEegohufdCqOvcCiENKCvYevXOC9N08T3RqGuOa25CC0q8WhObmb9ndOnNN
	PldV/KOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVzu-0000000EKiC-3KH3
	for ath12k@archiver.kernel.org;
	Tue, 18 Jun 2024 10:23:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVzr-0000000EKgt-2Ds5
	for ath12k@lists.infradead.org;
	Tue, 18 Jun 2024 10:23:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I7Rh9C027454;
	Tue, 18 Jun 2024 10:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfkYRWLpwrmj1akdvRqXCoaaWZ8G2kQWq2bWxnuP6rc=; b=YVVXpPgiFHc3N2M0
	ajzLBqucMYoYZsKnVekYmHLcteieIPLi8stlsu+NwlLY4CSjOeoIQCS1XAACgf/t
	GwLaQ5tR7w0H3BD+x+ORpG+IyVegkEpTr7NeJXEqi/6ix57/8oYo0PlkXcGkmI9w
	INYeELcYQrKuiBSBHugBQh+4xWnOY493MtH+Ybfg7EJQCFl7ZkDU92vfEMpuyao0
	gWPzcANbAqpViwH9mI2u/htUaFHVItuWJbKHVF9maWuv/f1iPlFizo+t9Anf/nV+
	mwv4ARySnBfV5JC8f5fpVtD/KIdqs7VAkaKM14XEHMUMmoD/hqXY47ESgbBkVqfy
	KHOqZA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys3qf68fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 10:23:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IANPZq021198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 10:23:25 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 03:23:23 -0700
Message-ID: <b27c93c1-4f16-4989-b06c-9c00e9086372@quicinc.com>
Date: Tue, 18 Jun 2024 18:23:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: prepare sta data structure for MLO
 handling
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20240617131650.3288118-1-quic_ramess@quicinc.com>
 <20240617131650.3288118-4-quic_ramess@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240617131650.3288118-4-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pG3Ye47YmsvkUbzx5129U4oJ6yI33Ov3
X-Proofpoint-ORIG-GUID: pG3Ye47YmsvkUbzx5129U4oJ6yI33Ov3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 mlxlogscore=776 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_032327_683461_D92663C2 
X-CRM114-Status: UNSURE (   7.60  )
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



On 6/17/2024 9:16 PM, Rameshkumar Sundaram wrote:
> @@ -4748,6 +4804,7 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
>  	}
>  
>  	rcu_read_lock();
> +	arsta = &ahsta->deflink;
same as in patch [1/3], do we really need rcu to protect ath12k_sta::deflink?

>  	arvif = &ahvif->deflink;
>  	spin_lock_bh(&ar->ab->base_lock);

