Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A3AC6FD1F
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3GWE1qSupUY20Y6R/rpg+vgPMIS2Hu0yYXwkiwEMCY=; b=Q1oHGYoxanZVcX2/UbM5oOqbL9
	FAbupIwQpwL0e4hEda9r4M3FzrbC7Blfskq/ibw2vzid1CD9ZEdnYh6j5Zbs9huqoAYzxX6IawYZj
	fSVmCTAd71Ya/K16BpIH8PHnMKiygiwVM5kB43BmjVVu9LR6245OP1XQCndT2EcVtROcP06ubAzmU
	7UFggQ/E7bh6018Z1t3ETfCrUcSIe9lDs5KDGyGXXrmylr9dV/ZA4kZqQYrVa8IwHM9H1CY/xlHPI
	Y435dmQsWHKJknS1uQLGmbUOiQDE1q/ZJC5C6uCWfyHj66UvmCIIacj3HTpMRU33fUmOJb72hyj/K
	5OkF6V8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rri98-0000000CEe0-22EQ
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 17:42:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rri95-0000000CEdA-2iMB
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 17:42:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432HDuGA014062;
	Tue, 2 Apr 2024 17:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=T3GWE1qSupUY20Y6R/rpg+vgPMIS2Hu0yYXwkiwEMCY=; b=nP
	YOVy6AizY52vVM7d9JjZIwQRZXnn9D7mMFxzuZDZAqXXPKxDamd7ltNDcoSXM9Zm
	iShusafuMIXLQofNdIkY2RU9EMYD6Ms1kWlW8xfIhN5efik1+s7zLqrGZ+Rm+m/E
	XKFEIeZcdHozVtT8IM9MAoOxD9B6r+uyqTi5PU/zLdMSnlL5o9NP79NQMrfpTIRn
	JZAhENt3g/hR4v5kIcPGj0+bMxZxfT1tkSynFu0ryBHZFKYamM0IBpNwdRpiRmMW
	s9EEvqRQ01fYkeiCxSb9VEd/cWxYw8w1jQ2w5p7cYaeO5FN3re1kWKwueQUvUlT7
	Xkoh+cS2zliYtflp9fdw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8h5es2e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 17:41:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432HfsM6017964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 17:41:54 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 10:41:53 -0700
Message-ID: <6dac32c7-a2b2-4ac3-9c1f-b02f612ee3ef@quicinc.com>
Date: Tue, 2 Apr 2024 10:41:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: extend the link capable flag
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240329012358.2242354-1-quic_periyasa@quicinc.com>
 <20240329012358.2242354-2-quic_periyasa@quicinc.com>
 <f17ab010-5874-495a-8bd8-3e18e85cc327@quicinc.com>
 <ebeb7fa3-f0d1-230a-80bc-0877fdab7e62@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <ebeb7fa3-f0d1-230a-80bc-0877fdab7e62@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xGoqcFyAnJ3QbKhjaIMD9PzkJHpY7xb2
X-Proofpoint-ORIG-GUID: xGoqcFyAnJ3QbKhjaIMD9PzkJHpY7xb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_10,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=697 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404020131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_104203_882374_D968B06D 
X-CRM114-Status: GOOD (  13.52  )
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

On 4/2/2024 2:32 AM, Karthikeyan Periyasamy wrote:
> 
> 
> On 4/1/2024 10:24 PM, Jeff Johnson wrote:
>> On 3/28/2024 6:23 PM, Karthikeyan Periyasamy wrote:
>>> Link capability categorized as Single Link Operation (SLO) and Multi Link
>>> Operation (MLO).
>>>
>>> 	* Intra-chip SLO/MLO refers to links present within a chip
>>> 	* Inter-chip SLO/MLO refers to links present across multiple chips
>>
>> Is "chip" the correct term?
>>
>> I'm thinking that this should be called "device" since that is the unit of
>> hardware that is detected by a bus probe function and which is handled by a
>> *device* driver.
>>
>> Doesn't this make more sense if the references to chip and SoC are changed to
>> device?
>>
> 
> In the QMI, SLO/MLO parameter exposed as chip only not device. So 
> followed the same terminology to avoid confusion for code readability.
> 
> struct wlfw_host_mlo_chip_info_s_v01 {
>          u8 chip_id;
>          u8 num_local_links;
>          u8 hw_link_id[QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01];
>          u8 valid_mlo_link_id[QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01];
> };
> 
> struct qmi_wlanfw_host_cap_req_msg_v01 {
> 
> ...
> 
> u8 mlo_num_chips;
> 
> u8 mlo_chip_info_valid;
> 
> struct wlfw_host_mlo_chip_info_s_v01 
> mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
> 
> ...
> 
> }
> 

Please don't let firmware interface naming drive host driver code naming.
And push back on the firmware team when they've introduced poor naming.

As many Software Engineering experts stress, naming is probably the single
most important thing we do. So we need to make sure we are using the correct
names for all of the software objects that comprise the driver, especially
with this multi-device MLO feature where we now have to represent a multitude
of individual devices as a single logical wiphy.

Lack of a single common term for each object in the architecture makes the
code far less maintainable.

/jeff

