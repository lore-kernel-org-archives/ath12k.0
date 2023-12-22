Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747FCC46CD3
	for <ath12k@archiver.kernel.org>; Fri, 22 Dec 2023 00:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzpSahJebBeFnfxT6xxdN+zLRHqhDWWWvNYVVTQE1U8=; b=u7URT9JsBQ/QwKsKBZd1tVVMuy
	ZND+5Tp123yGgudiU93eUEECR4TJk5Q/wTn5UF/EYJl8haqwTzJ7vCDExI3Qy2/eFa4NAAchenh/O
	SNuhcaACsk2EJ82aHWntcPLG3ScPnQAItdp54/dz0jUDWD7jkZI6ByKW/PO1eWblVOyJ7ji8TSt7p
	Lk7isVyMaf7acy8/BcvQVxP3y2eA+9r3pkuHc5U9PODosupzkx2evrAC5Ny7qfMPbF29v2W1HtL8d
	0c/tiPz+tZ84nq90dZCVo+s4BEhZSAcHs3fdKG6Dc1b31DwVXjWUfEbSTD/BKZ1r76W8/XJ1xSlMq
	nYHr7QAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGSzB-004Tb0-0S
	for ath12k@archiver.kernel.org;
	Fri, 22 Dec 2023 00:01:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGSz7-004Ta6-0r
	for ath12k@lists.infradead.org;
	Fri, 22 Dec 2023 00:01:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BLMlq6h005438;
	Fri, 22 Dec 2023 00:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YzpSahJebBeFnfxT6xxdN+zLRHqhDWWWvNYVVTQE1U8=; b=B4
	MhGLEYVXVScQ+7Mn7j9VBZcuulx6N+W9tkhzi3mAdUrz/nNAPI0k8+7Vb9jKLfx5
	BqT17smnxjuCARbLRfVEB/iPLd0w+lz+1WbPmzhT4Ja5UGQdAyrTmT7qcKlVJRl0
	Df9f/XfH1p2/rxR7EB85upNBceEb5Y/rfzklQI5RFaUf/2QxQZgdNH3REeiCNGhD
	0OK7CSA4NaExBgNmhZDy6uwToXlwU4YWE2cW8ov6zTBkHYlGzqt/O11ltjYO7RuD
	b0BDFdCwDbhpOSGqKx2d9lRcHl+612nBq6CKjsLjYbmnpWwyMVS8hrSkGoPQSyY/
	FPUsamh38AWjtf83IY/Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v4gvh2pk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 00:01:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BM01iwq002521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 00:01:44 GMT
Received: from [10.110.5.151] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Dec
 2023 16:01:43 -0800
Message-ID: <33c2105b-8dd6-4dee-949f-7ced7078f197@quicinc.com>
Date: Thu, 21 Dec 2023 16:01:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: refactor ath12k_wmi_tlv_parse_alloc()
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20231219091022.70861-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231219091022.70861-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: giT7jNSZCtMuVkONSIRQD8uT4yVO3pzJ
X-Proofpoint-GUID: giT7jNSZCtMuVkONSIRQD8uT4yVO3pzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0
 mlxlogscore=559 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312210182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_160149_332409_215C9780 
X-CRM114-Status: UNSURE (   8.45  )
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

On 12/19/2023 1:10 AM, Dmitry Antipov wrote:
> Since 'ath12k_wmi_tlv_parse_alloc()' always operates on 'skb->data,
> skb->len' tuple, it may be simplified to pass the only 'skb' argument
> instead (which implies refactoring of 'ath12k_pull_bcn_tx_status_ev()',
> 'ath12k_pull_chan_info_ev()' and 'ath12k_pull_pdev_temp_ev()' in the
> same way). This is an ath12k counterpart of the recently submitted
> ath11k patch and compile tested only as well.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


