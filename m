Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83167C54E58
	for <ath12k@archiver.kernel.org>; Mon, 11 Mar 2024 18:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dbnZy9PMAwLUevb9cJ5wVzKNdfRDIk6OIje3IIgNk8=; b=zCwh+3NQVJ4tiuCHYF5U5t27BJ
	xvCJPK0W6B6D52JYe54h6/c0dLy4gyx5e5/BlAZpzmEuqQNuf2vgCgo/xzDFLl8N+A6R25zmoRfhg
	61HmFGtlPYbVRDIyeudKKP1atNPjD3l3vmf9UKhxwPedYQ9WzVYrJfbPh10eXTHF56sThyJ7Tx9hX
	TGhaSDCNm7IfnYN26lJUIWKPf4E81oaaks77/XUg4Bv2um2luiI/UPZY7yBLJWSBDe3WLU9suMb7o
	Tnkm8dbjrHjFZR72YSPO5pmFSqLNa0eUiSkIWmUXv4K47BKcXjHQ9wIibv993lOH2JwpJd4rhVXLL
	dXzLzsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjkJv-00000002gQQ-0G3X
	for ath12k@archiver.kernel.org;
	Mon, 11 Mar 2024 18:24:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjkJq-00000002gP2-21sm
	for ath12k@lists.infradead.org;
	Mon, 11 Mar 2024 18:24:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42BI6d5O015197;
	Mon, 11 Mar 2024 18:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3dbnZy9PMAwLUevb9cJ5wVzKNdfRDIk6OIje3IIgNk8=; b=bl
	vCPZ8jrHp3oOXP8ee9kkLZfuWgXXbiVHsyLtNOz2PVqd8RhdDSlS9xafRLxfCaIO
	JKjo9AnxwBqJxH6y/bD+EFWW/nOrQINYklTu71PyEGv5whGlHx8lUN9oEo7RgyK+
	vNroAi9JCfCBBxBSnJevGIxSJ4AZGyLuzYTxvaZg4kNc922wPzpF2xE7bWkQwQzi
	4/yhcHo5ndRKh7HxROSgDzvll/AcvnhePRGRu+uOkVQrY+Ej8Pmb1yOhjmyYVSFU
	CadBgWTBwCNszcBkITF0SH35FHeCx5n2cfaXYWa/bLWIVqMML4eU7+nOYHxsokHm
	34V0GTWtzy7XjyWqMuTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wt6xr01f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 18:24:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BIOC4q022319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 18:24:12 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Mar
 2024 11:24:11 -0700
Message-ID: <65a0c600-ce42-4945-9a7f-6874cb98ad34@quicinc.com>
Date: Mon, 11 Mar 2024 11:24:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix desc address calculation in wbm tx
 completion
Content-Language: en-US
To: <quic_tmariyap@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240311180708.9334-1-quic_tmariyap@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240311180708.9334-1-quic_tmariyap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C89pv61tODLIF4N8wEUVO88o-DYWsgAi
X-Proofpoint-ORIG-GUID: C89pv61tODLIF4N8wEUVO88o-DYWsgAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_112414_888219_25C4B004 
X-CRM114-Status: UNSURE (   8.58  )
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

On 3/11/2024 11:07 AM, quic_tmariyap@quicinc.com wrote:
> From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> 
> In tx completion, status desc is obtained from offsetting the address
> from wbm ring. Having HTT_TX_WBM_COMP_STATUS_OFFSET(8) and reserved 8
> bytes in status desc offsets the address twice and read the values
> from the incorrect address. Hence, remove the
> HTT_TX_WBM_COMP_STATUS_OFFSET from wbm completion address calculation.
> 
> Also this patch is applicable for WCN7850.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


