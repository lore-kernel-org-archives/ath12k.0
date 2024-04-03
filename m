Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6551CD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh+QfXVliJEet/I68QAud/iIxqeAK3JX5Qd0R5YQrIM=; b=z917SBYTwbnPWSqQqQ6xXBd9GV
	hJLpQMC36S2bgsFMg7B458oVoz18TQaAJV14eBjqZXpglBDdTW7Ty+1RN/qZkBybJbFXPlYKljsOI
	Gpdb5SvqKksovU4STCnLMlRKA/BP2SQcGFegNA48ZIqD1ldfu1Cunvg9i23ElDolDAxDFn2mWrBAt
	uxlWA7OAkgh6GWtZNZDrfvTVulO5rhgnayu6garFg/H6r3eV3/ZiW7W4GHI9MAtsRNxTHL4ajjjQr
	97vggmTvw/gCmuOk2W3Pgq2V6PEC7YDXyvL0RvqFxknrqF3nv6msNr4rduOI5KgwADdKt6k16RbYR
	Nxe0v+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs6IO-0000000HYrb-23cy
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 19:29:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs6IL-0000000HYpj-07Zw
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 19:29:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433JCufE009313;
	Wed, 3 Apr 2024 19:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Lh+QfXVliJEet/I68QAud/iIxqeAK3JX5Qd0R5YQrIM=; b=lZ
	BC/PlQV3MJtySgAYNeooWdBTHqg9bBAaW+mJvGFyLRc6h0fwt/T54v07orNvzwLP
	VTZ8e82+oWnGFbpPLEIrq2a69v7FLQZ0Zj7b8LWdqGyHfgJMcJnTDFPT0P41wz0c
	gN+uTtIvbbRmuR6CgYRCM22a2j2Ml+1tDfjPaIMPyzunn+FIkceEZ4c6MlxUMygA
	I0UxIR7/Ige1S3+g09sC8o1pfMaS8v2rUTjmyXCkcuTdwCK0TRF9AsL2ahKEi1Jh
	kVRsLaerqtrzYCGVlhk00AncEf2lS1aa9+9v5Ukq2Bp00/bNu8yJsFWUDMyLYY3Q
	cMb463X9ZbwfuQzgDRFA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x993u0p2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 19:29:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433JT8K5012512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 19:29:08 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 12:29:07 -0700
Message-ID: <01689e50-3bff-464e-95ff-1b24bdac8a78@quicinc.com>
Date: Wed, 3 Apr 2024 12:29:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] [RESEND] wifi: ath12k: extend the link capable
 flag
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
 <20240403042056.1504209-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240403042056.1504209-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IMolaJF7bDGVrEojyRg9JXYAFH6l-OLV
X-Proofpoint-ORIG-GUID: IMolaJF7bDGVrEojyRg9JXYAFH6l-OLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_20,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=840 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_122913_125476_D3A1DCED 
X-CRM114-Status: UNSURE (   8.46  )
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

On 4/2/2024 9:20 PM, Karthikeyan Periyasamy wrote:
> Link capability categorized as Single Link Operation (SLO) and Multi Link
> Operation (MLO).
> 
>  - Intra-device SLO/MLO refers to links present within a device
>  - Inter-device SLO/MLO refers to links present across multiple devices
> 
> Currently, driver uses a boolean variable to represent intra-device SLO/MLO
> capability. To accommodate inter-device SLO/MLO capabilities within the
> same variable, modify the existing variable name and type. Define a new
> enumeration for the link capabilities to accommodate both intra-device
> and inter-device scenarios. Populate the enum based on the supported
> capabilities.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



