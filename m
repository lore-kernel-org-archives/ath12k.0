Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1188C54E58
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeHxhxY2CVZBtS6JH63o1WCJdzxR5XMCgwaK76KzxlE=; b=tG0fCJWS6UknakPRRq0ex2XBy3
	0nksJaAg4MsS02awcyOFMsjMOqBEzlR392zNUpyVe4nUDgxEER8tohZPp6l4I9QLl8AcN0+ltbYA0
	CaBXrrZw4cGML0mt7RJZwEUnqXqQ3dV4+yoXFerqRYFsToHi7ITcsHmNgH3fDPozuEDPbhQXfyIlN
	StF+bfJCSicxR2jcCdLCmQUa0hR8A/72pnjXzIw2G+9APF4AJFkS4TovlVb4cfgNtgxpw6IZ55t3z
	MQxKTkeT3jlS+99RAN+SOuIueavpoNg6rW+RxLfDlDHsPUyuPVRLVnuAflj3eyCBILNrfbozQk/gZ
	fvmLoRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn30H-00000000y4k-188S
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 20:57:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn30D-00000000y3z-0xxg
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 20:57:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KJPuKG015927;
	Wed, 20 Mar 2024 20:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=VeHxhxY2CVZBtS6JH63o1WCJdzxR5XMCgwaK76KzxlE=; b=XC
	KTgpEXMNnhEnQPuLksqJmcgMkwyngxrpWvRvkbMW17TggD9SDP+j6cMz0XysF+YV
	LS1D3K24euLWvO7Dj8JfwLn11GQx0p2QPl8Y8wF42nLS0l8xGwUd4NYLNOCljIBZ
	/jdfOE1I3eUU+D+YT6VzcRxFGGnvx6YVuZMPurN6+6N093GgHA0stRMBkqjnV+pq
	PM6NCUY7cEwG0rE9Iv0AauYHGuY4/ynkjCWeaBQN46VVWhRHkM1H9BTll2WEmGsM
	GXTN2XjOxl8DMYcddxRu5HGIMpHjb5ayne2rCC4YQJLU70M4dKh+V2X+1zdgTt+3
	Iuwmoo3TlaOWDFkv4/9Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wypxq2a0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 20:57:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42KKvYdO026313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 20:57:34 GMT
Received: from [10.110.120.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 13:57:34 -0700
Message-ID: <6f003deb-33c5-4861-8d9e-69da91d7392d@quicinc.com>
Date: Wed, 20 Mar 2024 13:57:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Add radar simulation debugfs support
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240320171305.655288-1-quic_rgnanase@quicinc.com>
 <20240320171305.655288-3-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240320171305.655288-3-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VrY_H23PtsfuhAGgrTpMuCC1bx6FMdQ9
X-Proofpoint-GUID: VrY_H23PtsfuhAGgrTpMuCC1bx6FMdQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_11,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403140001 definitions=main-2403200167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135737_417122_1A311E51 
X-CRM114-Status: UNSURE (   6.99  )
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

On 3/20/2024 10:13 AM, Ramya Gnanasekar wrote:
> Create dfs_simulate_radar debugfs in ath12k debugfs directory.
> 
> Usage:
> echo 1 > /sys/kernel/debug/ath12k/pci-0000:06:00.0/mac0/dfs_simulate_radar
> 
> This debugfs helps user to simulate RADAR interference in run time.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


