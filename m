Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9041C25B75
	for <ath12k@archiver.kernel.org>; Fri, 31 May 2024 03:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjVXWs3TMk0YZ7HwrH6kSwG++1DjIPs5r4spHdo7hjo=; b=kgEH0EDDfWT2O/qWTpvzNosa6P
	gZgTT6CDzBQq6vXZYuFWUjyZM7Qdk49t3yfzzYoHu1k8kn6L5Har7Vfj0NtG6eqRybcuW+/jIcvUh
	LNvES0ZW0veba1e+7Y1fN833l4Gh1L/y+b+rDtfoxmOxeatCNF/l9HfMljYRMbUJ+LEA1zHR0ZI/7
	iJd3lPjcXnbigq7AlfT1YwOVdBlQVcWgcj4t7xx9j4L92eAZMXHRqhfgleX9gjf6gfmT9RVgU52Pi
	oEpubcXGgWuKb1+7rrumrMwS9O4eNkokpBs8ZPzVta+kl2M+t1RAIFDlKHWWwIA4NYhSEI1VIQfn1
	wjIp/VXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCtHK-000000098hJ-2h52
	for ath12k@archiver.kernel.org;
	Fri, 31 May 2024 03:50:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCtHH-000000098ge-3KIo
	for ath12k@lists.infradead.org;
	Fri, 31 May 2024 03:50:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ULgfUj026579;
	Fri, 31 May 2024 03:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QjVXWs3TMk0YZ7HwrH6kSwG++1DjIPs5r4spHdo7hjo=; b=R2v7YZ/ogx4758OD
	1JT6mZ+Tderu80vEw9xlgOSGOjiIdSNpdeEvhngSaLWmx6hWoE0BNPlGFEBX5UXH
	1+xp73+qvxyPuKPZJdoI6NhAFPadftPZznaHa+ShANloT+A0J7/8zTzgv1TuXbC7
	mdIHsWqZ8paJFYhzLBpYOU1LiWTimToWMf+VaGuyl1ovH8GQUgD+onwo/E06FcSU
	DM4OAXjdYtAb445PHufVy1rN8UNtMX2Ad0Tee04KH2YgMdgUS9BteyDOzkZDLTQL
	B8cdeV2CXyvkpSSsVEYyY5o1Hx3seEoHcRVvkqu7Wpk42sUKbKPHvtZm6FmxUQaQ
	D2OPCg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qnqq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 03:50:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V3nfC3009174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 03:49:41 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 20:49:40 -0700
Message-ID: <a50aa1fd-14e9-469a-a98e-2475ac682f29@quicinc.com>
Date: Fri, 31 May 2024 11:49:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] wifi: ath12k: support ARP and NS offload
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240530072714.25671-1-quic_bqiang@quicinc.com>
 <20240530072714.25671-7-quic_bqiang@quicinc.com>
 <ccf9791b-e050-4844-8c37-35873fb3fcaf@quicinc.com>
 <17721436-19fb-4337-9058-b20f4df2792c@quicinc.com>
Content-Language: en-US
In-Reply-To: <17721436-19fb-4337-9058-b20f4df2792c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KXgYPZs5kYG_un0OronMHl0Sz5rMjxWZ
X-Proofpoint-ORIG-GUID: KXgYPZs5kYG_un0OronMHl0Sz5rMjxWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_21,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=785 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_205003_996208_DC2A6B9F 
X-CRM114-Status: UNSURE (   9.53  )
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



On 5/31/2024 11:42 AM, Baochen Qiang wrote:
>> as noted above does it make more sense to get the netdev associated with the
>> arvif and then use in6_dev_get(net_device) to get the inet6_dev rather than
>> caching the pointer from the ipv6_addr_changed() callback?
> Ah.. I didn't note that we can get inet6_dev in such a way, just thought the only way is to cache it in ipv6_changed() callback.
> 
> will get it using the following in next version:
> 	struct ieee80211_vif *vif = container_of(arvif)
sorry, should be:
	struct ieee80211_vif *vif = arvif->vif

> 	struct ieee80211_sub_if_data *sub_if_data = container_of(vif)
> 	struct net_dev *ndev = sub_if_data->dev
> 	struct inet6_dev *idev = in6_dev_get(ndev)

