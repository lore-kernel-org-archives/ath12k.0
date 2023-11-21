Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D48C61D85
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TX2og7/xTM/Af98BqITr8OLs38yC11wTZBisguqPlCU=; b=o4ZSee9fA3V1i5
	aJpt7bPKjV3a3e7kaM8c24avcwWhEtsZdzPxmgALYsn15aKh5TRnJxltVdExu1kKcJwXIeiCm+oFg
	djRUtzX+01wSPol/+PnQkZkLtQKhaNZm5o55EEzdBdVj6RnK77sHJSUjh6ZSNIqrveZA6xYGnqtMo
	ODgKARLP3HRJpADlnQSdQ6+f6X9PuhhxgASOYgZ5cPMzejqXDuWXf0Tr6EJMaRtgRpZ+IQwcxRVyB
	W7MBgP5aJ3w9f9biPV5ValnOMQZ0Hmacme81DzvMr3JKPnXN8kRlRD3L9RH5djwJuPMuPpdXkZwPN
	QrLAIkUYUYogBANnEYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TGA-00HEsF-1Y
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 16:05:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TG8-00HEr1-0V
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 16:05:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALE2BCq027398;
	Tue, 21 Nov 2023 16:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KkvoM8mdTtdzle5BxAyY+qCeJH34TcZXB9iNlrCyCIw=;
 b=cH+9g7kISLww1ZgKuSPOLzFs2m64wAeXO6XpVaWg4Utt6hrrnBuKIDybFWNVmAoVk6CQ
 /088f3Ll71ADsWZAXt930f2KMD4HcmkXZYln39akKeWvW99OlCpjFPoHAKocqrVt95OY
 7JF1cjgQnpFjQWvfwbLeA1Y7/0/EtOzyt5NNEku7ueqlyVPu4ai+Ac1xRSbzGn1dnONz
 ZqIz41sa5/XvPWidqs5AI//sZkfTRbSXhPK8ogt/5kes11D/2lrnW3fRGyJUTg3v4AZS
 H+ZhoK184z8ACzjAYGp1/qffnqHDYkYu3tsINe7dhr19fzCPOgKOf1a2+RrEAjjmT9xd qw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugk6x27h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:05:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALG5pjU024751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:05:51 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 Nov
 2023 08:05:51 -0800
Message-ID: <a0f3945a-687c-4533-baac-1d1e4a9e15e7@quicinc.com>
Date: Tue, 21 Nov 2023 08:05:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix and enable AP mode for WCN7850
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231121022459.17209-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231121022459.17209-1-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uxtV1BChH1H1JXcQGDclkH6FBTQZE_jh
X-Proofpoint-ORIG-GUID: uxtV1BChH1H1JXcQGDclkH6FBTQZE_jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_09,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=687
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_080556_326689_51272076 
X-CRM114-Status: GOOD (  12.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 6:24 PM, Kang Yang wrote:
> For AP mode, the peer is created earlier in ath12k_mac_op_add_interface().
> But ath12k_mac_op_assign_vif_chanctx() will try to create peer again.
> Then an error will return which make startup of AP mode fail.
> 
> Kernel log:
> [ 5017.665006] ath12k_pci 0000:04:00.0: failed to create peer after vdev start delay: -22
> 
> wpa_supplicant log:
> Failed to set beacon parameters
> Interface initialization failed
> wls1: interface state UNINITIALIZED->DISABLED
> wls1: AP-DISABLED
> wls1: Unable to setup interface.
> Failed to initialize AP interface
> wls1: interface state DISABLED->DISABLED
> wls1: AP-DISABLED
> 
> So change this check and enable AP mode for WCN7850, then soft AP can
> work normally.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
