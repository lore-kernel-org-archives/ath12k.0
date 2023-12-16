Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB30FC46CA2
	for <ath12k@archiver.kernel.org>; Sat, 16 Dec 2023 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+1dIMCJhetZu7A1JplteXqHjZw3T02zteJa8LbmnfY=; b=tZgijiy3C5Ck+Q/Pz4d2ZhVf1P
	26EeV9LGxXzv/20/KOme5/mzgg5tt6jrLqv5NO7deSUSEXPV/2PRHHG3AulfqBVnOZi7qYFmJ1Jxd
	llEN+eL4c8rqNtm1Hc7/HeB5/QGQKkwgMZHyr/EsPweQHP4hoFQf1ubt9i+7D1grRab1AXFBwKbYM
	eJPaZ8/Ws07a9aPyxk9qhPzfKpqnmsFNgS0IU11k5csfYgpGsvws9hiW+fbDDCErz2ZZVS+bU7EeA
	ARmrjaysVTI/9JDWqxw1Ms7OmGAfjeD9zESZVgVh7dpA3Etq41FCihrjsHjaIezOGL5eO+ECXjKlW
	ujGo9Prg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaCq-006bpI-1Y
	for ath12k@archiver.kernel.org;
	Sat, 16 Dec 2023 19:20:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaCo-006bos-18
	for ath12k@lists.infradead.org;
	Sat, 16 Dec 2023 19:20:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BGJK9AN031469;
	Sat, 16 Dec 2023 19:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=d+1dIMCJhetZu7A1JplteXqHjZw3T02zteJa8LbmnfY=; b=Xc
	KKf6W/TzBM0g5M+OykCxf6miE24ZrnGLnBP7ogPpiTpy8WMZNxq/fM+GSrT8RP64
	Hxg2qudIbNIZFVvz55dbbWoXqyqlQCKKIWNe5nM1DSlAXUdp+QF+W8ACmQQlYaBj
	weIfPVBEiSLYk8QvZ9o3Uxb/+nC2n/cFuiLtHhUkHj0l/VROvFopHaIwy07+LPYS
	xUDIIqsukuSdB+Vd+q7H4UzuuUeu45N9zNAI5ry0vVI/Dc6t4/K+GzHufuYllpTq
	jprMzwWShsDz6ddfzDSkbJ2vxW1/bUPHXuHomIiWFYJ3iWUzgZJUW1P7hOg9NvXL
	1EUqybd81NtU6irlHcGA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v1531s1jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 19:20:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BGJK8ll021865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 19:20:08 GMT
Received: from [10.110.36.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 16 Dec
 2023 11:20:07 -0800
Message-ID: <b9fa390c-1d34-4bc8-9214-e6393303a070@quicinc.com>
Date: Sat, 16 Dec 2023 11:20:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath12k: add support to search regdb data in
 board-2.bin for WCN7850
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231216060140.30611-1-quic_bqiang@quicinc.com>
 <20231216060140.30611-5-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231216060140.30611-5-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zneXI4Uea3ET0swSQYPh2pJIcnGROhEE
X-Proofpoint-ORIG-GUID: zneXI4Uea3ET0swSQYPh2pJIcnGROhEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=973
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312160148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_112010_508510_01990D9D 
X-CRM114-Status: UNSURE (   9.92  )
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

On 12/15/2023 10:01 PM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently ath12k only downloads the same regdb.bin file for all WCN7850
> chips, actually ath12k needs to distinguish all different WCN7850 chips.
> 
> This is to re-use the string type which includes bus, chip id, board id,
> vendor, device, subsystem-vendor, subsystem-device and variant for
> WCN7850 to distinguish different regdb in board-2.bin.
> 
> ath12k will first load board-2.bin and search in it for the regdb data
> with the above parameters. If matched with one regdb data, download it
> to firmware. And if not, download regdb.bin instead.
> 
> Add enum value ATH12K_BD_IE_REGDB and enum type ath12k_bd_ie_regdb_type
> to distinguish regdb data and board data since they are in the same file
> board-2.bin.
> 
> Test log:
<snipped>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


