Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB8E6F06E
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2pPds8Ycu2TwykjF3yAej1i7YQDGSrdDEQr/xg2UMA=; b=nYx1U9LFYHDwjQ12tJbrUIKxri
	kP+CkFPqBzQw6FKJIVqM4svi2KS4yBQRzpBtZHu881jNFBy6zRpZvsWM+JNicfTOsbfeSmTbwwmTj
	fBTA8Q4fbvJVCF4xh/pmxJ977eUi40XhWvB5ecZel8Jh6zfS9MQa8TzQ/WeJPu9/CFksv9+s4K9au
	aAGFOg77Im3Bko9aM/JBbM2bisELtA3dg0uq7E+BW7TnQ7pegYe8+o6+HVzNqzAnr1cmw7IfqqutF
	nz+xUeeIhEZ5M1ghytuc12WUHuoAJ+oN5LY4/I0u1nqIkqP7lOl9LLmKvKgjV7ZkDCGTKC89nG72g
	e+FeUGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uvj-00000007l6i-2YAB
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 16:55:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6unM-00000007jrE-2WMz
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 16:46:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1C4itX020866;
	Fri, 1 Nov 2024 16:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2pPds8Ycu2TwykjF3yAej1i7YQDGSrdDEQr/xg2UMA=; b=HnJ3kHnVChiIaedb
	bQMqrscy5xptk9JAHstiWr5MAlpj2oJe738HElqasBx5gYHKi9S/ZU8LW8tK2/My
	9k3C6wHCmYndXYVgbRWIn5QtOAKnQUEyLmMFJfDilMp3BHHvlaqgjwCobNSNHneV
	sDwg72HxIcPRXLVv9X/FxD+hsHowhYqvS6vfJQHseYQVsWbcUSjRh1GEf9zVO1g5
	s336IDjxprED4Ef3BXnDVliS+XIaw+ylsK2XHbNocF0E56T00smH/QXOdbYZ63H0
	moIhV1IFEdtlnm3p6LYDWkzQxE7RA0wwSFAKCSpHvkhS6U/WS+X+8ooXD961xTlS
	U21SdQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m1rpnvgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 16:46:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1GkeMh031760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 16:46:40 GMT
Received: from [10.48.242.225] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 09:46:40 -0700
Message-ID: <16707c9b-66a6-4656-8999-134af1250c92@quicinc.com>
Date: Fri, 1 Nov 2024 09:46:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] wifi: ath12k: add multi-link flag in peer create
 command
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241101151705.165987-1-kvalo@kernel.org>
 <20241101151705.165987-7-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241101151705.165987-7-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wcchypyDeS0oFSrLg4AGjRU2s_0M86Fc
X-Proofpoint-ORIG-GUID: wcchypyDeS0oFSrLg4AGjRU2s_0M86Fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=926 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_094644_673152_09348E2D 
X-CRM114-Status: UNSURE (   7.47  )
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

On 11/1/2024 8:17 AM, Kalle Valo wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Driver should indicate to firmware whether a peer is multi-link or not in peer
> create command using multi-link flag. Add changes to support
> WMI_TAG_MLO_PEER_CREATE_PARAMS in WMI_PEER_CREATE_CMDID.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


