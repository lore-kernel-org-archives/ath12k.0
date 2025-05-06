Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750FEC3ABBC
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 06:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qo5APBlAsBwlnIUKxYgjOAJm+c95jDWmD6uX6OlM718=; b=V/XHRvCBTw58jTxHy/mmgVC2Xe
	tNjHYCuYY9MFzqmF7YJ0yOGWGq7MAkO7Yy2IAamlQCEwzbMpmgb6AaS5ltbcqjI14N5ZPbfRYII9P
	7sknrUpj2LwKzAhesF+HMKe4OoP8q6Rs8Qrevtby0uVdr9X88INxRhkkWbqiijNCpqIVHrPGNqOUA
	FLDPHYhXgDdufyALpfXZZXPAtcT63tQt/sv2+eR2ENZniriXohS4O4yq/2goeKYUQkkakRbo4G3HW
	dntqqIfUjkTANqKS326HsWG9klIWx6DP9pT5KkAF0iV5b4GqYpphziHwfMTNpQRdkX7dexeo1PrI2
	7LiOPweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBsH-0000000Ai2b-0ogN;
	Tue, 06 May 2025 06:33:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBfB-0000000Ae6d-1BP3
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 06:20:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTXS8007903;
	Tue, 6 May 2025 06:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qo5APBlAsBwlnIUKxYgjOAJm+c95jDWmD6uX6OlM718=; b=NTi8FmKAvgNwkfTX
	mhWZGPGMCWu3hwZHyzCsoMrkM2YELWt2OLwQpX7r8xuFqfltpybZdYM2ed0BVvIl
	NNU/6cN3hxuCpQP5bcgYFDzVeL5h0Cf3T3ww1eioKGYmcvMUfu2GYe3uxO+dxDcR
	i3uGlTQh9KBJT6Ml1GJ6dkMKEgAwWD+/wIkvwRN7Cr2DHokxcbVCvj8W4+ZCeVuj
	0tWR9Ft4neY6acGRHyd0342mviPtYgqmWAD23EHmXzwN6qmc3nJJpZbSyXOh6mX0
	kAQX73oQBtOb43UL2PHdHl6ZxeloOTV6+OSB5Aj/KFIE+7mVqrbftr1RTAKyb8wZ
	gEFJPQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep6n5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 06:20:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5466KIJd007682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 06:20:18 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 23:20:17 -0700
Message-ID: <b9922b54-15fe-4176-ad4f-1eaa28efe5ea@quicinc.com>
Date: Tue, 6 May 2025 14:20:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: status of AP + STA concurrency (DBS) support on
 WCN7850 hw2.0
To: Parth Panchoil <parth105105@gmail.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <c3e75c695e8b8d58dabffbe00b8fc58db75d9a23.camel@gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <c3e75c695e8b8d58dabffbe00b8fc58db75d9a23.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6819aa23 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=a-zRGgT0AAAA:8
 a=OYRL_cGF8CBXBDp5kjYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IkFK-M677-wC91MmSCEv:22
X-Proofpoint-ORIG-GUID: WoSry2PvbUvep7ZWyztU103uUkSLaaOX
X-Proofpoint-GUID: WoSry2PvbUvep7ZWyztU103uUkSLaaOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1OCBTYWx0ZWRfXzqN2DDMWK4nL
 vsr9XCS1X1tGxh51daGTSi8eCZKk4nhX5FYXVIDXibSM4QKJsrxGFP0V7Xb05vJ9Dk/xLO2yUcZ
 A8iZoM/BknrbagfeDWXJbjsDLuW9abwzDgO4R7nGQ7WllbXp9a/FQx7bqLorDnv7itMjrWVEsk8
 zcYaT1taisHiWq3j8VXplYtX5np4nA7ijUbjwiDzbC1nn/7ifm+fxZ/6VSZayuWU5ZFZky0LCOk
 iVqzi7g5SEAEdd72PLNa3wWqThcE8GS7vaNT8RiOE4fWRVBG2zB/LqN//GonpbKLsp4S3uLrKDs
 dwKlCjBMddiGFcFZ8bVGj/XybPBsEUaWjIpMxA4NKguas5XRyXlMFBs9R53alAXpkQDlUivCp/s
 zMPdFsy87PqNfc7oLsMc5uYd5rkoqKgsjXsWodKBje/qu8TBcBMlRKYS4+LE/HJ5W/IhX+Fd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=961 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_232021_447576_43FB3DFB 
X-CRM114-Status: GOOD (  10.11  )
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



On 4/30/2025 9:22 PM, Parth Panchoil wrote:
> Hello everyone,
> 
> I am testing the ath12k driver (ath-202504172310 tag) with mainline
> firmware on WCN7850 hw2.0 using the SX-PCEBE Wi-Fi module, and noticed
> that AP + STA concurrency (DBS mode) does not appear to be working.

For WCN7850, ath12k has limited concurrency support. That means it might work with some
specific configurations, like channels etc..

Please share all necessary information to debug further, such as wpa_supplicant/hostapd
config, kernel/wpa_supplicant/hostapd logs, firmware you are using etc.

And by 'not working' please clearly describe the issue you saw.

> 
> Could someone clarify whether this feature is currently supported in
> the mainline driver and firmware, or if it’s still under development?
> 
> Silex SX-PCEBE module reference:
> https://www.silextechnology.com/connectivity-solutions/embedded-wireless/sx-pcebe
> 
> Thank you.
> 
> Regards,
> Parth P


