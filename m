Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20C6C2BBCA
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 00:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbdLEe27pad8QYvgFcmoFIfhy5+V7lkkbl31wZ/GXRI=; b=mr03aYKbjWZBULgMe0KpFqxl78
	EuqlICztN0ohHRKns2Sfh0W8uxYRwtxxG1skQfR21ILkn2FUjwcHfrow7R6jtySec9gFsFGQO1jV/
	CMwNTDdJITdqgv2rbcnSo9IOBlO/dVOuVPBCiWgoVoOsr059OWSp1pioMfOWwuxPiVs87nnYgbVjL
	cGsF5be2lrtHYSGjXi7RYT3UdB/f2RlItWFyKq75y+ikkBJIyU3JWQo7h/Iong2w8WA+f0ETNSv4N
	oSII6OUWR5YfQZMFH9XjtQdwJVwPeFFFBiL0AZV9CFaFzmIO1uF5wH+lL/EVWsF8zqgne0NQg+HhI
	xk1kfbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMGeW-00000004uaZ-2EYt
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 00:36:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMGeS-00000004uZy-463V
	for ath12k@lists.infradead.org;
	Wed, 26 Jun 2024 00:36:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PH4j7I018178;
	Wed, 26 Jun 2024 00:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbdLEe27pad8QYvgFcmoFIfhy5+V7lkkbl31wZ/GXRI=; b=g7OUPIdq271QZX88
	pnrmryJ/yH6YpMj9da3Npyt/mTTkOzz1oy1z2NCaN4jIzY6+CIUCMvZW7TPDGKDl
	4+FUyxvVXxFIlnN6kcMV9A7/3JwaCrbV0ZNM8VM3QdXl6k1XNb0SKoXiqH6hzAt9
	P6PEjBzw+rhKby9kcBWaDqt9gHGsiZN622K9sQeQChdSnn6YZbob6WEYVgkxvbEe
	ftZ7BCgj7tij7jRwBBpFhldO+Go5kTGPIQYdUmueBANmKWDUUBmPYs9D6Af0HJnI
	3a2Bt70hUufpyP/doOsrEnTcZ5/zKnd19Fk98adYWcvKqvZfRT/sr3KymjrK/DU1
	8eKC2Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywkyn84mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 00:36:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q0adPb006280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 00:36:39 GMT
Received: from [10.50.50.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 17:36:37 -0700
Message-ID: <42e80698-5667-5cf9-f8e1-38c9816889c0@quicinc.com>
Date: Wed, 26 Jun 2024 06:06:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] wifi: ath12k: fix peer metadata parsing
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240624145418.2043461-1-quic_periyasa@quicinc.com>
 <87frt1hvc9.fsf@kernel.org>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <87frt1hvc9.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G28z-W2S3iTUR94GSMZTtVOFE6XPK73w
X-Proofpoint-GUID: G28z-W2S3iTUR94GSMZTtVOFE6XPK73w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_19,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_173645_179058_8560BCB8 
X-CRM114-Status: GOOD (  12.84  )
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



On 6/25/2024 9:23 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> Currently, the Rx data path only supports parsing peer metadata of version
>> zero. However, the QCN9274 platform configures the peer metadata version
>> as V1B. When V1B peer metadata is parsed using the version zero logic,
>> invalid data is populated, causing valid packets to be dropped. To address
>> this issue, refactor the peer metadata version and add the version based
>> parsing to populate the data from peer metadata correctly.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: 287033810990 ("wifi: ath12k: add support for peer meta data version")
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> [...]
> 
>> +static u16 ath12k_dp_rx_get_peer_id(enum ath12k_peer_metadata_version ver,
>> +				    __le32 peer_metadata)
>> +{
>> +	switch (ver) {
>> +	default:
>> +		WARN_ON(1);
>> +		fallthrough;
> 
> I'm a bit wary of using WARN_ON() in data path, so in the pending branch
> I changed this to ath12k_warn():
> 
> 	default:
> 		ath12k_warn(ab, "Unknown peer metadata version: %d", ver);
> 		fallthrough;
> 
> The benefit is also that now we print the unknown value. Would this
> work?
> 
> Please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=0228ca402186a123e5c90187f952121de50bf64f
> 

Looks fine to me.

Thanks.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

