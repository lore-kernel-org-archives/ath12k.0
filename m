Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD05EC4706C
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOCEDzel1H4poWe2j3Gs1k33+vb40Ybzkt5feTZDjFM=; b=vploRcqIP/gc2h8nD/hKzqCFuj
	FsxwX8wjwvktpoaMjGDXJCygRAgfEkHQdwtO+1i3J8+LkuLT0BiIEzwrDr00qM3qqc6f/qcKO2D6N
	i+oexD9dk8aE+CMt9ZucNPFy1ePIOFLHdh4OXfukbeZ9HtTVjLT8g7MQiUdRLtA5SmKuGjTjSQN+J
	G1c7JkYft7QGKZIiTzhMH9Cul0mnnzbTKVbihsWekZ3zo5VpnJ4YJ77u3KEh6q7eaAMmYoKp06dvJ
	TkANd95CJg3spRoNQ0X4+Ww+4p0h/k+mewaLyjao2JcS2v3UndcOeTdz4uDy5ww7PXdSw5I/RO7qO
	TLTOwU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKdx-003M3Q-1b
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 16:44:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKdv-003M2C-02
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 16:44:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CFxORp010509;
	Fri, 12 Jan 2024 16:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sOCEDzel1H4poWe2j3Gs1k33+vb40Ybzkt5feTZDjFM=; b=ZO
	xml9t7o9EWuCAIrVXStrfGEKwVp8YxhnbIWyCfUeIgKnTZQk+aR6mZ8BI9QPY1mg
	lK6x4s22RLKw+l7tf8kw20zvB16hWk6xUt2h94hEz0mpHPgf/jX+PkfZdyGVZwNQ
	k/X8h+E6+XX9jf1KP3H3OL97QgEybVM4x7G1CVjGF6NEijmzmJKgccaIczMSG9zt
	Gs1xzwYlKFkVPorXYYy/u0Ycql92I3MFjlTn2s1UpAcLovlfUQq6dVVSvtnHwrQQ
	zKbWNobzLrGnwLBlObTVxFr4MFILvHKnELfxSOmEDld4p60iNs78Otra7DINX2t8
	lvfHYtoPaTz3BhoBkZuQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk1x195ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 16:44:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CGiP6h018677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 16:44:25 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 08:44:25 -0800
Message-ID: <138fbc0d-4bb9-4a04-986d-c98facb43c9f@quicinc.com>
Date: Fri, 12 Jan 2024 08:44:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] wifi: ath12k: Add single wiphy support
Content-Language: en-US
To: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <f1431217-447e-4d1e-a97c-e5cea6ff2c36@quicinc.com>
 <606709d9eab84207b0ab73d12e7defcd@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <606709d9eab84207b0ab73d12e7defcd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z1t3RfJ-E18mjPIpzjgWemHo_NwYCVec
X-Proofpoint-GUID: Z1t3RfJ-E18mjPIpzjgWemHo_NwYCVec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=586 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_084427_050514_260E0041 
X-CRM114-Status: UNSURE (   9.55  )
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

On 1/11/2024 8:34 PM, Sriram R (QUIC) wrote:
>> -----Original Message-----
>> From: Jeff Johnson (QUIC) <quic_jjohnson@quicinc.com>
>> Sent: Friday, January 12, 2024 1:46 AM
>> To: Sriram R (QUIC) <quic_srirrama@quicinc.com>; ath12k@lists.infradead.org
>> Cc: linux-wireless@vger.kernel.org
>> Subject: Re: [PATCH 00/12] wifi: ath12k: Add single wiphy support
>>
>> On 1/10/2024 8:50 PM, Sriram R wrote:
>>> This patchset is dependent on "[PATCH 0/2] wifi: ath12k: Introduce hw
>> abstraction"
>>
>> I'm currently unable to apply the prerequisite patches to my workspace, so I won't
>> be able to review your patches until that is resolved.
> Sure. I believe its resolved with "[PATCH v2 0/2] wifi: ath12k: Introduce hw abstraction".

Yes, I have now processed the prerequisite patchset, and your patchset
applies cleanly on top of that.

As already mentioned you need to add your S-O-B to all patches that you
are posting on behalf of others. But let me review the individual
patches to make sure I don't have any other comments before you re-spin.

/jeff


