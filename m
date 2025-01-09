Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89AAE7719A
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DHD6/tYHN4tKdVA0UATA5TPjVjyIjuosBtS+ep/QFU=; b=qu8znI/gBKbjVFpXcODXxFx3P6
	m+5WIDU2e7Kouv2WuO2QNB3TICqRXfhJUs8+maBNC6u4xmDT+lgeE0VSB+KPtIBF25ifEGpntpA5T
	uCipKTMOi3zRO+FyXkMHBhioCkBmhcTvdf3dNoHMhopJ7ZHq9uLNHbs98lIGF/s2dfHXUJwj81lwi
	/CQT4EbAZRUKA7cqXqd10K+LibYjfbxprtuH6LNL66VHMMYooVLb75jXxyNNvmwrFF7ZpRLQhzaSF
	TpjfTxWzFYmPxqo1jb3E40M3jsulwnaLmHUA1ohB6nTVpBVDGmiu+nxTDfDDnV0UXlizNL6TSZIjo
	wqV2uLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrw6-0000000Bthy-2ae1
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 12:46:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrvI-0000000BtUS-3952
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 12:46:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509B3bnv024406;
	Thu, 9 Jan 2025 12:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9DHD6/tYHN4tKdVA0UATA5TPjVjyIjuosBtS+ep/QFU=; b=IJD33f5r6TpfTVcK
	Jqz/Sr2PXXAo6R2kqjA6EOELF4HVZ0MkMakmJJ6wIT7XA8CXMEM9W4oWquQCxFlV
	bT0b3m5DiIgZM/kW3rk+JmKXEuMqptg6hgjT/L1zzAMDu2S70RmJFRGzwQ8bK59p
	VFSE0KWuMFQqDF6JX+6X/R1sID27TgMa2/uf2h7iL/4v/Pg181ee4CpvoI+kzvst
	gDBCOM5shx+m3E4Y9JMM9tzPTLlL+OkI2czNqDspVHG7hRo6E/JZsX5b1XxicFfI
	L7Xikl+67lWAMsMyK4KgIcCK6I/8b771lYZclo+UQJ5WsENU9SVKeIq3dc1msPO2
	chieTA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442d8hg7ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 12:46:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509Ck1Xi009061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 12:46:01 GMT
Received: from [10.50.34.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 04:45:59 -0800
Message-ID: <4d9ddf3b-19f2-42b9-958b-62a1f0f7991d@quicinc.com>
Date: Thu, 9 Jan 2025 18:15:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: mac80211: update ML STA with EML capabilities
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Ramasamy Kaliappan
	<quic_rkaliapp@quicinc.com>
References: <20250107174802.1793252-1-quic_ramess@quicinc.com>
 <20250107174802.1793252-3-quic_ramess@quicinc.com>
 <6f61f6eaf03eec99f0f30d01501bc60f8ead1270.camel@sipsolutions.net>
Content-Language: en-US
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <6f61f6eaf03eec99f0f30d01501bc60f8ead1270.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x6tRKUgfMFXBEkk570UcimKkiJhI9Bqj
X-Proofpoint-ORIG-GUID: x6tRKUgfMFXBEkk570UcimKkiJhI9Bqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=806
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_044604_909497_90E07254 
X-CRM114-Status: UNSURE (   8.93  )
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




On 1/8/2025 2:04 PM, Johannes Berg wrote:
> On Tue, 2025-01-07 at 23:18 +0530, Rameshkumar Sundaram wrote:
>> +	if (params->eml_cap)
>> +		sta->sta.eml_cap = params->eml_cap;
>>
> It would seem to me that 0 is a valid value, so you may need a separate
> "was the attribute included and we're changing the value" flag?
Yes you're right, shall i add a new entry in 
station_parameters_apply_mask {} and use it for this ?

