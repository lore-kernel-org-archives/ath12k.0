Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2A1C71130
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 05:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nO29YvvxA3g37DZV759dO0hrJDh4lNF+Inrkz+JgWc=; b=ij2z5Hb915RoGoFJniMJ/Y6OJx
	NcLIXei+YiyLqkqf6UpV+TC2en78o7qZLATpyBW68N03O3fUhv2RkqItW5SUSCuMaR81KMUgp23lq
	NAbGbh2TmFjT3fsy7Usz3gOkVPFKkeChriDhxfM22nWzDvK/ceo+8w2hguhjr1f3tKAYee5FojG3o
	T+zym1aFlD1i3mcxRX/Rg6XsAKJQgNJ4poNl+0jntMFuGjmAkG9s6Er90UXreCwOiAVj+ue8YS9d6
	eIpw4oQh3oGEJTnqPcwkv8LC4wz+spkSantOzvI6T6HiaEORIVNN0HjK6onHhc60NdsTKFGdW5bzR
	blXGjB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ0aD-00000004IUy-1YAD;
	Tue, 08 Jul 2025 05:09:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ0aA-00000004IUf-2RQw
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 05:09:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567KSNQK006944;
	Tue, 8 Jul 2025 05:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6nO29YvvxA3g37DZV759dO0hrJDh4lNF+Inrkz+JgWc=; b=GDdw5m1sHeLhIhui
	uZmpOM2+4YhkKMWWBc1qfUuJusuIuNBx3ZT28PxMgbdUXrsUubY5zt63k/iO9RZ9
	E3SizuUuVsSqtMxvdybUCuDh1rZc/ILykNM5JNIDRkvwO25CzRizLz+izjUVd/jp
	bMM51QyqyuqSEC9YHtwqm3619beYPpVhcFZXopdqIOpXVPYtjz9J7ufo6Wbj9zQM
	rbOvliG22JTf2DGS4qn3PExAQ61itCkD6eysMg06rW5wQaLkfF/DT/kbxcxzBa/s
	U1zBESMRt7ht/xICulCkhMRRu0eyJipd6vZVfchKYP0clQTmBcMO1Qznu3hpuimt
	Xiu3rQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wamde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 05:09:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56859SxW019630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 05:09:28 GMT
Received: from [10.216.52.3] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 22:09:27 -0700
Message-ID: <3298c943-c26a-848c-0606-915295241f86@quicinc.com>
Date: Tue, 8 Jul 2025 10:39:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: allow beacon protection keys to
 be installed in hardware
Content-Language: en-US
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250604101620.2948103-1-karthikeyan.kathirvel@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250604101620.2948103-1-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ny80kNnzNPWP8Nbex1HB_LaSnTT_nwT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAzNyBTYWx0ZWRfX2CI4vO8w4gDS
 XQrgcELS6l+lw/By6s8Q7lCs3e8QdXzIEoOyVdDTrQw4Ex82TRZsv2sRoTpE9XLvcBtwBXuQVrO
 b7R2eJoA/+EGq/dCscw53FWMJwdlwU5+mNaabeJ5zP/X5DzHtnIvOn4FNBKqk02vxRxHOmc6juT
 NM8cmggZcjx+svq46p+WiEDyIP24krLuy7LDbp3Wg11CINbOC66bVcCYb8ZtEPaV7vn+w+JRBk4
 95OS/eyuXCyJCuS86BxYOxzbMVYb7QgulC+Jp8AAdyuP7KQl0RZXEuYl447ItDvNUIDDjlNkLyN
 5VBcsnkN8dKB8Qxg21tm+ghs47LOcsAthE94BW0fSNw7XF1j6taLtMfn1D1G40ywW4jsuYznVHb
 63KRZO16vamy44dojLw8/P0LDQdemts6xtAwFijImEA9lkAn/mAl0+IiZHEuTDepTOthUr8C
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686ca809 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=pyrcEYqWyCnS-5z31K8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Ny80kNnzNPWP8Nbex1HB_LaSnTT_nwT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=773 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_220930_897086_9A4E9D05 
X-CRM114-Status: UNSURE (   9.70  )
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



On 6/4/2025 3:46 PM, Karthikeyan Kathirvel wrote:
> Install beacon protection keys in hardware for AP modes only if hardware
> supports it, as indicated by the WMI service bit
> WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT. Allow keyidx up to 7, since
> beacon protection uses keyidx 6 and 7.
> 
> Control this feature by setting bit 0 of feature_enable_bitmap when sending
> the WMI_BCN_TMPL_CMDID command to firmware.
> 
> Check for the beacon protection enabled bit in both tx and non-tx profiles
> for MBSSID cases. If set in either profile, enable the beacon protection
> feature in firmware for transmitted vif.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

