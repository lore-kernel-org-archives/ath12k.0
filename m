Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A04CD128A
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crUe7CFX78Cs/RfoZIW5DSMcdYOCZfq+Shoh3jCjvlM=; b=p0Z4s65Zb6SFXvKZtUMA4f32KV
	ig6lyQogFiPpzBiZmdwOUDE+Nq5QoY8zay3jylYOaF6NkJF18SQ5+9qPvTcf4qtrAyVAwbs/eSatN
	X62E3rEgCDYNo/H6lS3MFUFlnCK32eNj2z3RVcyyVmClZTa0PY5AMWHIaaaSNOQTHQOkKvoS9Jd11
	8WdDEq/Tps+SNrStpZ3TqdCgiz1U7yQd+ysZD22KzqcKYxrukavNYYtkTYlKM5CSLGlDK6ahdvkym
	tsFqw4hHu2nXoJ8u9Dv1mbD0fc+LZC58n0mDWO/E0BSInxK9kuXNODcKe2J5X2/bEwqZFeme1wOmk
	2BTHv/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Ao-0000000HLgN-3x0T
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 18:17:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Am-0000000HLfD-30Ve
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 18:17:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433EfsH7012803;
	Wed, 3 Apr 2024 18:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=crUe7CFX78Cs/RfoZIW5DSMcdYOCZfq+Shoh3jCjvlM=; b=QP
	x6d3YU/I+JS4L/QG8shusr+yWxRMLnAyuUB7GYRSA+Oh2ja3G/z/ypodG0JpLrJ/
	CFM00P8e0ulySQ0ud34oZeuAsJNGP6En8fi/BPEgP9a3lqBsdbx9+KeEtrAtFdit
	My8G8BKN5jzrXdT5/vnqzgiXyL/gszflKGbuAjOHO+a5LVRDUcarxMUtfhXbD9Wb
	xylid50GBPUl1Rvg0tZfaBqA6NDV5Dq9ZG3OrZmC2wVx8mn+izyuHCO5gCpvgN9p
	ZWnr/wYBNqoJ/wr3yqS22CiTn+R38TN/kVZCnIjUwxHQQ2mkYCIR4PX+6kivXCI/
	qKBfwuR0ejGhFC89VHFA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x993u0hsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 18:17:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433IHJLP021826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 18:17:19 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 11:17:19 -0700
Message-ID: <ee4e97e7-ec55-441b-8658-3d9f3f0ecbc9@quicinc.com>
Date: Wed, 3 Apr 2024 11:17:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] wifi: ath12k: add MBSSID beacon support
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
 <20240402210538.7308-8-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240402210538.7308-8-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Gqdp83HynSj-IPF-tNr89db7ki2xvhHL
X-Proofpoint-ORIG-GUID: Gqdp83HynSj-IPF-tNr89db7ki2xvhHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_19,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=945 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111720_812291_5AC4A692 
X-CRM114-Status: UNSURE (   9.40  )
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
> - A single beacon template is used for one multiple BSSID group as
> only one interface from group transmits the beacons. But firmware
> requires the host to send this template each time a nontransmitted
> interface is brought up. Hence, modify existing logic to retrieve
> the template from vif context of the transmitting interface. Also,
> firmware crashes if host sends a template for a nontransmitted
> interface which is already up, add a check to avoid this.
> - Set rsnie_present and wpaie_present fields for nontransmitted VAPs.
> - Send offset to the multiple BSSID element in the beacon template
> firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



