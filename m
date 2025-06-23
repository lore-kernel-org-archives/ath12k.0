Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347C0C7115D
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 04:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvKSOXkNl1jFDCH3MXFTatOAN1N1bnBQ7Z6KfbqRi0s=; b=rfeoeworRwcTvxsy3KPJ4yY8G5
	FzO8DWxDc6d9NPwHp1uClS2jOZu4avdjG4BNsS5Y7zXbfhFSNtiNvUYpH6eSsmEdibImBhpv+3PrM
	+WFOARTLd7RJL6l0/o+28Toj0i6kIVyB5sGO3Y0VGeXcZafH8tAVY9I3pNmkjbxElKK4oH26/+jDS
	pXN7E0tH+2F4fGRsYhtxUJ2WAEuC9qO99hBEw60IbTEMsWZwDlPM2SnSyKbd3PL38jeahiQPgnZCg
	PGRMg3stUvkVoxEMKiOFcoMw/cCFeyvXmOeLVolcaycwu/5IJOKv4GHtXtxCtysf4KuwP/8gS3uSQ
	/yZLbO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTYgZ-00000001Y94-3Z72;
	Mon, 23 Jun 2025 04:21:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTYgW-00000001Y8h-3U6W
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 04:21:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N27nxq017094;
	Mon, 23 Jun 2025 04:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvKSOXkNl1jFDCH3MXFTatOAN1N1bnBQ7Z6KfbqRi0s=; b=n0DxqdbGu/OSu3Ni
	0Z+9gN3hPQsGfYBvSd5FC97ym2ukhAAUtvbbuyXuonOTuaORIXqmQdiszzECD4kV
	AFgHDj9yOxDQgDM5zc4HugLqdiKqIjEFS8hn2mseEnZYdLmIgG+XyjofkCAfMUvv
	+0oJW5ja7dXoc8OgupfxSween/uE4IxitxrfpCFD5WLX9k7LuvYp0EaWBNSWVBOj
	JB1fF85dk+aUm5z4vzs3o7/dVXuvN6XkFiEboJMeexXQTRRmHT37reAlfKuL0ANK
	tbm/5LE2M53Ey9vE7fM5ceB7m55q0c+Bl8+4cIkx6wmfzU3dAhSHFti0H7SnamBU
	IldCdQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ewv787sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:21:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55N4LU5I025103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:21:30 GMT
Received: from [10.216.31.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 22 Jun
 2025 21:21:29 -0700
Message-ID: <f36f180d-6100-cccb-d232-5875e4126005@quicinc.com>
Date: Mon, 23 Jun 2025 09:51:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v3] wifi: ath12k: Fix double budget decrement
 while reaping monitor ring
Content-Language: en-US
To: P Praneesh <praneesh.p@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250603103542.1164713-1-praneesh.p@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250603103542.1164713-1-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -_c3nAEEMg-rsaMANNWGWmEunLX7x3yL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyMyBTYWx0ZWRfX7DhyFeJ+jnVg
 9eQg+Dk0kotv9LCILzG5xLTYDEKiTZdkuLB+CpxRp8lmPZ2xLNY1PD0/EA6/fWhITyJMaZGKXSU
 GeoYjVmXSWUDo6nkf2bVn2RI9k35eRFocDB98GqHmftiRTQkAzi6edY4yP+Ka02GJ5czfZdBAVH
 gI5xK64Ok6P2PbR2xKP8ucRatHiXVYtl3MNXtiYVHzfi2fUBTzyHM1obnKPR/s6eK8iTxFABsZu
 rArYpDxsIf3AhTyN83wWoS1F867mpWtRne3D+3HPl7S0Ctrsgts9RHbOyJ+6A+KWiNP5NXucQ98
 kPY2C86gHDfker6rY3fDgKBaoLutBYddWI4Tcs5CtIBv/jZwWMoLcfuQ779N62xTmSPCnpmyAwD
 AhhRLl7YVjsBzvsz0y55DvywT8EE/DQAddYqD9M9A3tmfHqAx/cu5tRLVc0VcdFjp7m1Q4ih
X-Proofpoint-ORIG-GUID: -_c3nAEEMg-rsaMANNWGWmEunLX7x3yL
X-Authority-Analysis: v=2.4 cv=NtfRc9dJ c=1 sm=1 tr=0 ts=6858d64b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=f0_862vhOG2d2rrTCbkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=966 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_212132_990447_13AC6C5A 
X-CRM114-Status: UNSURE (   7.31  )
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



On 6/3/2025 4:05 PM, P Praneesh wrote:
> Currently, the budget for monitor ring is reduced during each ring entry
> reaping and again when the end reason is HAL_MON_END_OF_PPDU, leading to
> inefficient budget use. The below mentioned commit intended to decrement
> the budget only for HAL_MON_END_OF_PPDU but did not remove the other
> decrement. Fix this by eliminating the budget decrement for each ring entry
> reaping, ensuring the driver always reaps one full PPDU worth of entries
> from the monitor destination ring.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 394a3fa7c538 ("wifi: ath12k: Optimize NAPI budget by adjusting PPDU processing")
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

