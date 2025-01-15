Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6464DC02180
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 06:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGZ0TShWUotMxawqv6H0GihgtrKfMbRR2KqTx5c8Y5s=; b=Qazl2TOG3oreQgu9lDsIoo0cq/
	RU69/bOHlO+HYHdb7WT5PELSPfLXjFn3EA27jtRcRsUo9uMcpxZ1rG71cbuLUxLI48ly/Wq+ufZGJ
	nSKzhBJpEctWZG3A36D8tdmNk9NRpJ64HHwkvK6cdcQk5zhMiqOY/ZanucLs1+Itc1HTnZlkwCNPX
	OfaOTCqBtve8xisgcghIPsuenBCSyodW5f+jWcxJiDBiZCv5ryjyWwFqkbduoN9RnPskQS+1Zk7K3
	T03DMzC6kGfhkvU5MQoA6/kjX+lm4zvJ81DrfmeVgdKQZdqs+nL4QUkW28WJUWKvyCKCimx8GHU7I
	ICMswQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxEv-0000000ArEP-0iay
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 06:50:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXx90-0000000AqJv-0hbT
	for ath12k@lists.infradead.org;
	Wed, 15 Jan 2025 06:44:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ELcDJD012499;
	Wed, 15 Jan 2025 06:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGZ0TShWUotMxawqv6H0GihgtrKfMbRR2KqTx5c8Y5s=; b=JKE3iEj/xiPe7zpP
	QvlagR3fN5z4kSZwl96IDej0wU18ZvVkW0kKBjl8gSpWE8H5xYSt4AXzNgq4i+8d
	QySHV2mldQp8Lnaf6p7jTd5Q6vyeoF10fTNLSwsj7KPjfFtAoBoK4F9dZ5XJN3Em
	qwi1UvJcRtqW4Wi4OUZkzIJTuWLkhBvK95y7zkmWRftueItjs6zqFA8q9YSedTdb
	kQ+B4eT7prM2ax6oQqzDLe/TldmENUBMw7vVx1fQA+1nCWlaSKVGjApVktustrjx
	Vp/mrV73Tg09Hb5tP26iIrcZ5xbj2Cf50j8HsM+bYUvxzN+QlE/Qh5jAwvAVtYzI
	tBSYTg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44600p12jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 06:44:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F6imlh031430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 06:44:48 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 22:44:46 -0800
Message-ID: <1d6b6601-f8a6-4ec0-9741-29eb634fa391@quicinc.com>
Date: Wed, 15 Jan 2025 12:14:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] wifi: ath12k: Support Sounding, Latency, Trigger,
 FSE stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250114123835.882926-1-quic_rdevanat@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250114123835.882926-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MPtGlAPBL3MJWVEJGcLjVPU5gx-T8_1A
X-Proofpoint-GUID: MPtGlAPBL3MJWVEJGcLjVPU5gx-T8_1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_224450_221494_B025E92D 
X-CRM114-Status: UNSURE (   9.20  )
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

On 1/14/25 18:08, Roopni Devanathan wrote:
> Add support to request HTT stats type 22, 25, 26, 27 and 28 from
> firmware. These stats give sounding stats, latency stats, trigger stats
> for uplink OFDMA and MUMIMO and FSE stats, respectively.
> 
> v4:
>   - Squashed patches to avoid build warning.
> v3:
>   - Rebased on ToT.
>   - Removed patch dependencies.
> v2:
>   - Added line breaks where necessary, as pointed out by Kalle.
>   - Modified the use of pointer arithmetic print_array_to_buf_s8().
>   - Modified commit logs, as suggested by Kalle.
> 
> Dinesh Karthikeyan (4):
>    wifi: ath12k: Support Sounding Stats
>    wifi: ath12k: Support Latency Stats
>    wifi: ath12k: Support Uplink OFDMA Trigger Stats
>    wifi: ath12k: Support Received FSE Stats
> 
> Roopni Devanathan (1):
>    wifi: ath12k: Support Uplink MUMIMO Trigger Stats
> 
>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 736 ++++++++++++++++++
>   .../wireless/ath/ath12k/debugfs_htt_stats.h   | 269 ++++++-
>   2 files changed, 970 insertions(+), 35 deletions(-)
> 
> 
> base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256

Comments from v3 regarding copyright were ignored :(

v4 still throws -

* drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: 2025 copyright 
missing
* drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h: 2025 copyright 
missing

No need to resend just because of this. But if there is next version, 
please *address this*

-- 
Aditya

