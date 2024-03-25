Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D11C54E58
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgxrJr7RxCBZbVsl1HuThf/tnvSo8NafdzAd0VT/Vdc=; b=QSTBuv91k2Wnf0gxsf2iu+c184
	/tlGOzxXDlrvgki1WZQvROnHC8t9fekuwsLWbV0Is7HWeD8KB1GKBvYoag9kGrV42oLCBk80o6pv/
	mO0ZHPUoACgdM8SNJ8xOpAWn17FtGKBLlrO8IUpGbYNF1t54/SA20Qw1DjazHbiKYnxUuEhV2nkqR
	QFjdfhDIWUv//1XK8phg0K2l6OnXXHjnTTlSWWWaqaPG882oOdwt5JJUo7hU+TZc9Pf1gmWd7pXTi
	fv0ESboBqygRreU+45sSTcW+74B0SvKYW5x4pLltFH0hPm4Zh+rZyb+jGvUwcVaUEC6MY9grvSUo0
	lBgWxlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqjH-00000001lIL-1CS2
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 20:15:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqjE-00000001lHF-0AaM
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 20:15:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42PJWrB6024198;
	Mon, 25 Mar 2024 20:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=VgxrJr7RxCBZbVsl1HuThf/tnvSo8NafdzAd0VT/Vdc=; b=mL
	zvcfxw++rG8vdYyWwKKygkocE6rHlrLoR2m1zAB8qQBQezzL2shXK1jwlQ+M/HGG
	JHy3SKjScJgu3yStI0SLJyO0Rma4dXn7em1As6OYsTqMOIfnF1JOXvmUvR9SO4kK
	RmmrnhEac3/fDSJBko3kWZnUKeka1J7TlQR/WvGpPcf3BVsVtFPyEBvRTnXQ85Il
	0iuDnqNtyNr6fvNyaq/XZuVNhRZpbukUHySnkNClskvRT6ivltPsOoV7UtYEsh6Z
	yei3TLlopMFSECODciVNBtF1XQ6shS/OmJ77eIC0Im3ULJO3Z7HIraFIWXdg33Ov
	yHABE2pw+XHC7V8wDCDw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3626hjqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 20:15:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PKFUSH006736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 20:15:30 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 25 Mar
 2024 13:15:29 -0700
Message-ID: <42eda95a-34a7-4e0a-a57d-6f7c57b8f53a@quicinc.com>
Date: Mon, 25 Mar 2024 13:15:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3]wifi: ath12k: Add firmware coredump collection support
Content-Language: en-US
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240325183414.4016663-1-quic_ssreeela@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240325183414.4016663-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ddah0_Vwja2chAd1N6k_CRBqGAxbGPJc
X-Proofpoint-GUID: Ddah0_Vwja2chAd1N6k_CRBqGAxbGPJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_19,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=691 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_131532_147803_85326861 
X-CRM114-Status: UNSURE (   8.10  )
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

On 3/25/2024 11:34 AM, Sowmiya Sree Elavalagan wrote:
> In case of firmware assert snapshot of firmware memory is essential for
> debugging. Add firmware coredump collection support for PCI bus.
> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
> format and also pack various memory shared during QMI phase in separate
> TLVs.  Add necessary header and share the dumps to user space using dev
> coredump framework. Coredump collection is disabled by default and can
> be enabled using menuconfig. Dump collected for a radio is 55 MB
> approximately.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


