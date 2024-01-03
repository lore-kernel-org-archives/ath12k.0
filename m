Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B15C3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQcfWNH84fTI6ppkrerQp/AHkaBvM6TRb21BlfmK5PA=; b=MXjHNKe7S/UTtxeSScP965ReO6
	O9euWXSvE/c7ffgEAPWP+mmmK7uQs7kKlJaj3L+hsR8nrK0a0f+akCHc/RLYVVl1dHZgjyC65Q5Vb
	+lqb3xN/sNnTy5O+3iYt9vRIgp6J5XLTsUXJgMCcuN8nwwWMM9dh8l4igh5NQHyesO1pBhrNaH1rG
	+zLJa6e49REBJFV4GZqSrtnPbJhzxUdWPqFF3mZQwiNVMpozlHkUqwaneJBvBamOehfgBt2UoAi+v
	zBVk0YTSTUcTBI0qGke9ExCf5/IAw8Z4/eZz7BSTm7Td4tOF8fGFwke+b3AZxe1gzkGxYy3hS6imI
	jIiZEGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL56V-00BWyA-2N
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 17:32:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL56T-00BWxi-1N
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 17:32:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 403GveK6003582;
	Wed, 3 Jan 2024 17:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jQcfWNH84fTI6ppkrerQp/AHkaBvM6TRb21BlfmK5PA=; b=OU
	N+wVCvzBdtHbQ+3wr3ymDD+tn584B1Q4fFkYNfpx8mOMCHe0osFTXymjlSYD/VL7
	OCVnxc4JuM3rDOaehORCCLzjvxYMjfxRiclSxdb0Oo+yCAykUgcs+8n8QRSVzWKn
	TXXqzf8Ljp/7aFpOJG7EELn0fh2uaS6NxO1jKLlFz5Iwx3B8UmzjRWpsfjfLHmvB
	FiearHrUMbPNq8khxIr1yxgQE1MYK6RWxEc4e7CW+Onq1x3yEhlzvx/rKt9jiRpB
	/DWGpL8K4xcXLqO4/BBg/QL3MXlpRSgiSe3UzgW42euYjPNRtE75kcVVmnUKLguE
	LXikOnHMdrMvSWn+gtCA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vdaufr6r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 17:32:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 403HWSZi027609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 17:32:28 GMT
Received: from [10.110.76.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 3 Jan
 2024 09:32:27 -0800
Message-ID: <376e7963-0d93-4498-92df-40ecbfe92682@quicinc.com>
Date: Wed, 3 Jan 2024 09:32:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] wifi: ath12k: Refactor mac callback of stop
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
 <20240103063731.3356060-6-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240103063731.3356060-6-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: To6REmpyBe5zUXieKj-d0nEw66SOei0P
X-Proofpoint-ORIG-GUID: To6REmpyBe5zUXieKj-d0nEw66SOei0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxlogscore=294 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_093229_474711_856BB4EA 
X-CRM114-Status: UNSURE (   6.17  )
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

On 1/2/2024 10:37 PM, Karthikeyan Periyasamy wrote:
> To support single wiphy abstraction, introduce link/radio specific helper
> function in the mac80211 callback stop(). This way, the callback can be
> extended to handle multiple link/radio in the future.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


