Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E9AC47DA9
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 17:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djy+cM0Fs1lCYDxiono/XFC8TF4kpNBMh9BYZqFz4uY=; b=0Ch0nbRY/4ScrXuhQTd0fv7OmB
	RRqIGr0XbMyVo1eC5fiE4BdXjIfiXloRurF6Fcy6b/9pXKgTOhX21wKvseT29SXeMzsXHe5NFmKUu
	l1lLWbOEmdbRJfO95DSaFqkpvIkV+xcwZd1zmvHdFkIaA+btFxJyr3KmuUETKjzKGkq999nf/x3zD
	Y7QQRp2bpH9RqWmksvJgbx2Z1rOlkuf9rvnA/VYj10Q3Ry8m9xbG67h81pUA39EJqIvVolmilpgL6
	awRujHZpkiESDwwwv3ZGpavOsM82EwG+vPhdPtmeTkq4SH71M49YS3dJPPvBUuUkn1Hw/3Rt58YQu
	kFiifvEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrqu-0000000HYRC-3WSf
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 17:24:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrqs-0000000HYQa-3U0y
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 17:24:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40UHCVvP008528;
	Tue, 30 Jan 2024 17:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=djy+cM0Fs1lCYDxiono/XFC8TF4kpNBMh9BYZqFz4uY=; b=IA
	fngjHfEKGdc08dav2SfxW0rrgjA18m6168MIlEdMnbIA4OnOvAIU4NR2S1E4TZgu
	vcfePiqQU79FA2eL++4QpXbyUBl7cgToFXyl5b/HVMpA0eXztqYQ/sqcWNE0o5m6
	kaVCIvszWyurKeeP8jeCI2UmWNnvzRRsmmQffxMc8RETLei0ldiWo/jBoTZcYHjE
	s7xaA61hBFzeGsA2qwVuA71M+CCWsrmTZxfxD9ttrvneayGRK5UuC3DSap9crP+n
	4qEDR7u3PpEK3Quz7uV3nZR69mh8KukFbhVP4QOHdEdijyWASuaLd9S6xhPn5Jys
	2s9X0jGDvbEDIZtonh1Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxwwv9672-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:24:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UHOnCx021772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:24:49 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 09:24:48 -0800
Message-ID: <0a1e65bf-d673-463c-ba24-850b212fc1f2@quicinc.com>
Date: Tue, 30 Jan 2024 09:24:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/11] wifi: ath12k: designating channel frequency for
 ROC scan
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-11-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130040303.370590-11-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _DKuX26a-j2zytSkU6c_kkEXPiO4M8Sr
X-Proofpoint-ORIG-GUID: _DKuX26a-j2zytSkU6c_kkEXPiO4M8Sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_08,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxlogscore=852 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_092450_908351_324AFCE2 
X-CRM114-Status: UNSURE (   9.14  )
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

On 1/29/2024 8:03 PM, Kang Yang wrote:
> For P2P mode, the WLAN interface may be requested to remain on a
> specific channel and then to send some management frames on that
> channel. Now chananel frequency of wmi_mgmt_send_cmd is set as 0. As
> a result, firmware may choose a default but wrong channel.
> 
> Fix it by assigning chanfreq field with the ROC channel frequency.
> 
> This change only applies to WCN7850, other chips are not affected.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


