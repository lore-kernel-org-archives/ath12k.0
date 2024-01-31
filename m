Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4B0C47DB3
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y27dmeX92JcYJpz51a2V8WGnwnIinCCwMSgv2cesEVM=; b=Pm9G/XBzHHtccEs3vf6XqJafFw
	WwlxDgGQLvCAIaGpxPEshDmV7czI2MHCK+wTvfEBAErjhozln79MXi7DyKujKGFKUJ8yUK7xsWcKl
	eC/xAgNbf1FtqSnmwoEnnzS3gp9QmudntDLDkww744De/SdZGO8hrcWSSojjbM3oDQGtphBBgkXP+
	WJx1jmJWdTguFs6sasunK/lYSRJchI9/uyK1W33LF1ghPCe0fPj8HdecGHq4SoBMvANlCSiCfWDI2
	mxAbVX8G6VEFhJTJv60nQ47wO25E+9CgEzJPZK2M2MognhZtz6bT5P9QdWH8pK/2dy7UB47m+H9Qq
	XTOBBPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHoy-00000005RNl-2Fs0
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:08:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHow-00000005RNN-2SA2
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:08:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VCp5pi021169;
	Wed, 31 Jan 2024 21:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=y27dmeX92JcYJpz51a2V8WGnwnIinCCwMSgv2cesEVM=; b=gK
	npzvZPm/gHDicjzLCg5YKzkqabZ5tEpXe+t/QbjaoUuAfvh2/CFGTdE5/0oCE0wr
	HhTiYN1dr5eQFzpsAZOmj+253awqkyX+kt7xmxs2LKnBwOhEYtSQGsRxrcuId/uo
	tEGx2Yd9rM2ZvaENhOGrGTIJRU2xLWO4CzqlEHtMKZSXkprFhS4NwA6tdQ1zO7fa
	cWoP8namjBN19UNqrw2MG6nZWPpB1giu5LpF5ajvoTeOpnRSbPGsLwO/AbpjRqYZ
	ywaWlT9Zi5Is5WLLNVZqfWcJ3QqZvXAZbg/2hHaZYbaXPw1wvSvn3spyqQZAmwiN
	FK3kqpe6wZNxZmHTpfIQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyjas1v0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:08:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL8XuN004168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:08:33 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:08:32 -0800
Message-ID: <667978c4-9b5a-499f-9e39-7bb7d3be4d78@quicinc.com>
Date: Wed, 31 Jan 2024 13:08:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] wifi: ath12k: fix PCI read and write
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-12-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-12-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4Gc2kFh8aE5mu6MyYmEv56pjma8RbHUJ
X-Proofpoint-ORIG-GUID: 4Gc2kFh8aE5mu6MyYmEv56pjma8RbHUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 mlxlogscore=714 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130834_661606_246B6E4D 
X-CRM114-Status: UNSURE (   8.80  )
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

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently, PCI read is failing for the registers belonging to
> SECURITY_CONTROL_WLAN registers. These registers read is required
> to read the board-id to identify the dual-mac QCN9274 hardware.
> 
> The failure is because, for these registers (SECURITY_CONTROL_WLAN)
> offset, ath12k_pci_get_window_start() returns window_start as 0. Due
> to this PCI read is done without PCI select window and with
> window_start offset as 0.
> 
> Hence, fix PCI read and write by doing PCI select window and by using
> the correct window_start offset - WINDOW_START for
> SECURITY_CONTROL_WLAN registers.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


