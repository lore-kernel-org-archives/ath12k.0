Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1548C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIfdthUrUP3mcVeXO2qkv82/5p6EWQ7UmA1Ol7NcGH4=; b=nUDXKNIpj75vC0JTu1xDj4XkNJ
	1iUqi4jXtZElXcL0SKA37UAGgTzcGTU/PYaVnbdxD3okmZYU/2liZXm3C/NNM/y0z2oqoVQyBtUJ6
	K/oCOJBE0r8RL2/GZ+jg9sOhR/9HpWCdWCgi94nMjnSuEdB93Z2ez1QH3kt9jIevn1Fmj0SPpup/v
	5WIgmX12FWdBzJea8NvmdvbmRBOsk93tPXHy+6J8+YBXTWMO7wEGfdTsu1gVEpTN5DMP2fkyptvTC
	qk4jAiyEv1NRS28kUsss4ratfI0fxaHlp8uLxEHH+I0Gf6kdgEsLd7lr2iXJ52hCD3+R9Q0KPVoqD
	nbspShlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6dIf-0000000EGgb-0oCD
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 21:33:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6dIc-0000000EGdj-2vgN
	for ath12k@bombadil.infradead.org;
	Mon, 13 May 2024 21:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UIfdthUrUP3mcVeXO2qkv82/5p6EWQ7UmA1Ol7NcGH4=; b=YITYuV530FuGK0hRj5gjoSfhHU
	aRKEfotE68aHJ+OvWarehbvMHNrBb1OC4XTtW+VE8erMbEU4l7fT66B2WQsJXD8Z7nSC/B7AoYuat
	49Jokd0KmVfCBZgWf4P2Pf3h1ZJALGZwcj1C0sL/7muQBgyKGyuU5uAEeONAkP9cMIdfPzNnzeZN7
	YQ4j42X5mIuL+he6y3HWge1BZj3X4xF0z/Yg0U3KLDaB68hjrr00+NjBbvO8jG01m/7SQVax/xTMU
	ECSJx+Y/yfksHXfzeDygVsUwjT8uOkPnKovT4ygF7YJRAT3iClFk8Qa8+j6Q5jlhfDWJU79HIDpqf
	hYzPi4yA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6dIW-00000004c9j-1XE0
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 21:33:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8dPO018863;
	Mon, 13 May 2024 21:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UIfdthUrUP3mcVeXO2qkv82/5p6EWQ7UmA1Ol7NcGH4=; b=NH
	BZlh3PktC8IOcwyEaWXrn3om6xqAEXrds+l0Ftvf4mqi89joi/9DAkAwtUmrzhJh
	/DY2Y/rAZvRJ+SLT1tn7yYyXbzNiRrO9XCsCMJtirbMHskNTlolxk50XZHWg00NV
	qHGnZMbKAaXCQ3aQdX44sXAk64kKRqd7gij5u62NbGSXNkDP5oMbu1p24noP10J4
	kaMCLHk3OdH3aW/UZFOcdgv2KKEim+0ayQmRnOWPy4rnLn/VKj4uefrR/39LT2oz
	c7AcSAPe5HNmBIcusPU35kKE8VBy8JE7wZmoXrTYY3hoi2rGAkEMHEdivCoLLlSa
	EZZQqJf+vr4zJrG0l2IA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y20rtck1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 21:33:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DLXK6L003662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 21:33:20 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 14:33:19 -0700
Message-ID: <927a397d-7070-4d64-9247-84a7cbae07d9@quicinc.com>
Date: Mon, 13 May 2024 14:33:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 5/6] wifi: ath12k: refactor SMPS configuration
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240508173655.22191-1-quic_pradeepc@quicinc.com>
 <20240508173655.22191-6-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508173655.22191-6-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3aq2xaRg_uKAV9dmVmYPvFvXfd4k4een
X-Proofpoint-GUID: 3aq2xaRg_uKAV9dmVmYPvFvXfd4k4een
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_15,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxlogscore=797
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_223329_167506_ECA4F4BB 
X-CRM114-Status: UNSURE (   6.66  )
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

On 5/8/2024 10:36 AM, Pradeep Kumar Chitrapu wrote:
> Move fetching SMPS value to a new function and use u16_get_bits
> to extract it from capabilities. This will help in extending the
> functionality when SMPS support in 6 GHz band gets added in
> subsequent patches.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


