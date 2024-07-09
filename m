Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F51C2BD09
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9VA1iza+h9B8nN+Svz8hwQkj/T4Z31pBXmI7RGF0+g=; b=Ntu/0sojfd2TawGcK5927zK0Y+
	RNZFSD+uWDDdr0d1d1Jg7yBgjNbDBvbeFQGA48xkcR+rZCFUpd4RJJteScMn3ptAjPsYilTO3Uwbg
	PS1GuKzLgKPwLwtYU+xnrr+NrxkCmsCrCLDYh82MgPvFfyVMPp0jCz8iVsdtpULHTwM6Ftj4Herg2
	xaqLBlTIGzwA280VEnxTUTQH6xhDuUjJJmikdJun38akB4MWisv8B9I8Bm6miQXmrqEBXNTKh/Eqn
	dfuo1fSbZk60M8I7ZQLV4khYnpOrqDpEXBNN3sx2Z+Y0D38ojVJC/UBtbg9hSJa56CCzlwsZdSxkZ
	dN7lBuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRBfK-00000007XPq-1MCf
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 14:17:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRBfH-00000007XPJ-1XMU
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 14:17:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469ACx1Z007224;
	Tue, 9 Jul 2024 14:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9VA1iza+h9B8nN+Svz8hwQkj/T4Z31pBXmI7RGF0+g=; b=KUmqfjOFGgbIqx4S
	9NkyDaGWcCtFIsZnhwjk6Fv41rKyRJRmUTYe1Ub4GjPU40TDzhrMYvedWNw1ptNL
	2rzVbxv7TN7OvvaM42JYSg/g3mSzR4ihwdiRNhcIk36o7LZouzP5YMqP4Uh7Ug4K
	AOtjZ5JxKruh2RNuU/0BuhYIBJ5zimRfKHnMKQgGYvd5wuy2t6fo1AP9Knf9FMro
	Ei4stSpOZmkrPHcyOYP1JgImeL0JwLCOypenrbxSyORkZG0l4FFI8mR9Z5+v56uW
	3jPCVdSet+dH6NpraqNtZyCl3yjBjHIi4Zb0a/iW6J9qNecg+vcbxihrRe14nxg2
	z/v0Lw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmpsv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:17:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EHlbq004711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:17:47 GMT
Received: from [10.48.245.228] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 07:17:46 -0700
Message-ID: <10b11116-0523-4035-94d8-af244c96ed5d@quicinc.com>
Date: Tue, 9 Jul 2024 07:17:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix soft lockup on suspend
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
CC: Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        "Vasanthakumar
 Thiagarajan" <quic_vthiagar@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20240709073132.9168-1-johan+linaro@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240709073132.9168-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dorYZWuIwxNM8yS7s3Pl5bwj3ID3Istl
X-Proofpoint-ORIG-GUID: dorYZWuIwxNM8yS7s3Pl5bwj3ID3Istl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=615
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_071755_435416_02DE96DE 
X-CRM114-Status: GOOD (  12.26  )
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

On 7/9/2024 12:31 AM, Johan Hovold wrote:
> The ext interrupts are enabled when the firmware has been started, but
> this may never happen, for example, if the board configuration file is
> missing.
> 
> When the system is later suspended, the driver unconditionally tries to
> disable interrupts, which results in an irq disable imbalance and causes
> the driver to spin indefinitely in napi_synchronize().
> 
> Make sure that the interrupts have been enabled before attempting to
> disable them.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: stable@vger.kernel.org	# 6.3
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


