Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54969C5B543
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 05:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2nhgPnAlNxy8+rgUUUdvD4NqC/lP6n/L4BAZPK/zdo=; b=Rt5cLL2da/vuVQ8Y98Sr2xLvNN
	Cfn7y23Q7f2V4gkfoTjNdspiRNQpz/9PmlAqn1eypqvpEiMiFGQSh6kaFjiPF661af0KPYQltPBBf
	O/QJ4I0U1tViXOCDYTytT2pT3U2pXuKTHuMZhMOeQgGyCcFH18IgC7TQBsSQfxS/taiYLj3a8oDUA
	CMOUgM8WuT6iJjcOEXiOgJ8mfzXL+xbP84mzKxrJgpDhq8aDAgazHbPoHKIk/1wKqGdL3yQ2jT3v4
	HS9DwU92xYxm9aU1C64puE+03uIvgQqNYV0JMGueiwJkmGjneqrYHgtu5fRGbvm+j+/yJWGPS4I7H
	CMYnOidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3BJ-0000000ElQb-0KZj;
	Thu, 05 Jun 2025 05:30:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN39o-0000000ElGX-0kZ1
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 05:28:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554HJJK1027554;
	Thu, 5 Jun 2025 05:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2nhgPnAlNxy8+rgUUUdvD4NqC/lP6n/L4BAZPK/zdo=; b=C6f4wtlmDrYbgTEt
	der0z0jFOw8tHXyZPIapDsbWmGPdhRUeRuMYJ1WPcHy7aKVeI2c2idNiEcUWleGn
	deHBwSmNyFu/SdGG6oyDRTXjKS9EL5S39le5DJS0d02/RQEc7cwmWOWqxbJqzH6E
	Zmv9AXOfV36TTYVh3Ki8nNkJW72WUyebr0lqOLioHBTSrNF3PvntlLXIRSc2aHyJ
	Vo3M118phas4c4J8oo6Xc/08VbDSArzVfegHBsLh9R0zKDuGE48XO8HxQMgke0ab
	NBtmXMVXbzLGN+pnkY0UEzGzGM8arTGOB3uSosIRk4MJwu28weNqDGcMDq+yblkO
	D9RlCg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t85su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 05:28:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5555SaxU024457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Jun 2025 05:28:36 GMT
Received: from [10.216.44.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 22:28:32 -0700
Message-ID: <fb4763e4-0106-94da-548c-6c585ab8ff2f@quicinc.com>
Date: Thu, 5 Jun 2025 10:58:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST
 definition for WCN7850
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson
	<jjohnson@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Bhagavathi Perumal S
	<quic_bperumal@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
CC: Sriram R <quic_srirrama@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Parth Panchoil
	<parth105105@gmail.com>
References: <20250523-ath12k-wrong-global-reset-addr-v1-1-3b06eb556196@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250523-ath12k-wrong-global-reset-addr-v1-1-3b06eb556196@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=68412b0e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=17ir-Gtp1zVAAPY-F3MA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jm_FZWIanXm3UkUXi9rD9HpK5lQoSJYT
X-Proofpoint-GUID: jm_FZWIanXm3UkUXi9rD9HpK5lQoSJYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0NiBTYWx0ZWRfX08ybtEULpqSU
 TyKqO8j9oAB38jqmnSuBptOv9o+ILvYDefh1zgwESy+1dIUn5vQ8Lgylah24zorBgIwKs7E8fYr
 FH7n86tJYuErw+xLn4wZFA2HGuJEzyvFVNPxk8d2l6T+DKRAwnFLZCV7EmKBVNQIqQ9GE2wrYsG
 LAUJao5jmgIF0n0ULlk3PJtHQdx00mas96qS6WSwX15F3liGqgPVI45U+T1UKEHSZFy8NYyyAP/
 nwnNOCUUowPioO7vPthn7cBMOJg3g8NzHK0opX/XPYD91COIuB6KrhUHJUFyIIsUpAFUWoq23/D
 jazW+LgsHHJteIZwKtCsOBVUh1zoq+pkVdQCSpmaQn0L/WOQ9RPjZruDkMSKodz7Ug3s0ec86z9
 Qo+PEKyVwwnUy4HYZEIoXgHFT5Gf34e9HhZZFu2zqzZJULu1y8nDliSmcjwrJDNtVbK6e6kZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 mlxlogscore=503 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_222852_226985_59625BB1 
X-CRM114-Status: UNSURE (   9.09  )
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



On 5/23/2025 7:53 AM, Baochen Qiang wrote:
> GCC_GCC_PCIE_HOT_RST is wrongly defined for WCN7850, causing kernel crash
> on some specific platforms.
> 
> Since this register is divergent for WCN7850 and QCN9274, move it to
> register table to allow different definitions. Then correct the register
> address for WCN7850 to fix this issue.
> 
> Note IPQ5332 is not affected as it is not PCIe based device.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Reported-by: Parth Panchoil <parth105105@gmail.com>
> Closes: https://lore.kernel.org/all/86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

