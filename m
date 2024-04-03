Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5417DCD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JVR9Am/YAc4h52RJU+UpM+ZSLJJJ0x+GMEQGCwWOt8=; b=MJRRkYbkJV8FCRfT2vtJ0AQnKT
	L6DujkbbIOXZk7Hj0MBLr0KhQGqlkWgvbT2jpw8w+6hcP1PA/eVk0lsBN17FS9Qf1yuXA/HgU3RP0
	3hzvm5VjBBDoMyB61EpcfxK0dSFHAH6jripuAoma4fRhmQL279j3LrpSoj6VqOopY0brk5loJ4MyX
	t35A57IzgMbdkap/COkktKpzJDeJFERZtb8SlpFbgZsOD54AM/jyuJUEJ++9VPJ2Lika/XzelHHPm
	gks+BJasbwLavKQxM7Sgi23haVHNUDiqTxA0pX9HFNvvKLLqL2J5Eqakp5j/RDXqN9qozDou+7tih
	snOVta3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Aw-0000000HLjk-00r3
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 18:17:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5As-0000000HLiZ-1RT5
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 18:17:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433Fd5KS010152;
	Wed, 3 Apr 2024 18:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6JVR9Am/YAc4h52RJU+UpM+ZSLJJJ0x+GMEQGCwWOt8=; b=WD
	qfR3rq/B7Lg2+kAzFFs0/H47Iu55RtwF/vlDLJyiInocuP+dabLnazxmLwDY7DcF
	W1ZS6YjdPLbxZ2K/EzZR1YkDUxsWslvvRZlyllwgzKLb0KfRIg0Wckr5D5K0+F3n
	RI+AKxU6sxYrhpgO9QCpPW+iHYs64PMCjUCqCTCi7slUs6SIlkBDMf8IYXflZaHH
	dL8TtRICBl47m86wecvdYDsDVVqXeUKy6XKrkbATJ56lE5ryF5HfwK9Zi6/pkPb5
	kIsDj1S2CVQNTyH0LQyX0oTpqtdby6TGWZNhSJsM5V4dm7tcZA/ReIvr4Ln3mBL1
	GsGu6rRFA/kWLH04F++A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x99xm8ce3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 18:17:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433IHOG8023440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 18:17:24 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 11:17:24 -0700
Message-ID: <9ef48dfd-60b6-432d-abd3-8e45c4892310@quicinc.com>
Date: Wed, 3 Apr 2024 11:17:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] wifi: ath12k: add EMA beacon support
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
 <20240402210538.7308-9-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240402210538.7308-9-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mCB1j1075g0HKJv_khPKS1MLiKlFjzeG
X-Proofpoint-ORIG-GUID: mCB1j1075g0HKJv_khPKS1MLiKlFjzeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_19,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 mlxlogscore=775 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111726_425587_61425014 
X-CRM114-Status: UNSURE (   7.29  )
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

On 4/2/2024 2:05 PM, Aloka Dixit wrote:
> Add new function ath12k_mac_setup_bcn_tmpl_ema() which retrieves
> a list of EMA (Enhanced Multi-BSSID Advertisements) beacon templates
> from mac80211 and sends all to firmware. Add support to send EMA
> configurations to firmware by adding a new parameter 'ema_params' in
> struct wmi_bcn_tmpl_cmd.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


