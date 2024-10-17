Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882B1D3C526
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JHEWdi44CFocuk6SWRK/s7L704YIYj+qbPEBPZbByo=; b=hmZnLOmdk7svRpjWySnDnCgNVy
	itzIEWEr2nAeVd4jxh9iopY0XvzZpq+EKkEemiVv5J5cVDQbO2kRs1STT/kb/y4gnGVhizTJpzCPT
	U2DUsJt1u6wXpQpiau0oh304s8eaJ3oPS2kbji6o2FCbJdeGfhym0DtNbpXyFEBSnwr18RXkaHDDE
	lHCNOMekSsi7rZREBaO9QAoOiKfCciZJQk6SPrsM6NuAJWmf/cyJW2hkG1kh1O6EYIkLjiOpCIVvd
	DLTUcdRFU1P5nsU5Bkgnv8b0bVdxhk3x0Jww5ZFdyg06U6MHSH/fHGEzFHe7ni9evd79rijK9oQmy
	zFTJdefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Uo7-0000000FnzV-15j9
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 18:01:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Tbu-0000000FYTk-1FMB
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 16:44:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7xomQ020121;
	Thu, 17 Oct 2024 16:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JHEWdi44CFocuk6SWRK/s7L704YIYj+qbPEBPZbByo=; b=ApfjmDHQiOtV3Ey3
	gsyyDIr90W86sx6x63rNtRGH916znzkYzM0riixU6PJ09bLM5vZSH2SOPXVNP5Oq
	h90KmUY8PDqAdq6svd9oFSgbB/NbhwLWtMlphMKiruhwpI1xrJMea7spGBxMp7gd
	BXxvOwpmEZbMRF3fr4CsWJ2xL6BWhI0GOTcxGDHTlwpSIGfGecc1gq+OtHfgB3Jb
	cnqJfu/YlFU2ySXD+sYVfsb+JaEfpVDt8SOJVJ0TOfm70xVLOnUlpkiQ2cuU8Mql
	mVdZbyU7vdgYMjlw/ePemCItQLw5Ar4a9SQ6dPyYCHog+TQfHvAsy69xYxvP7v98
	pX/JYA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429m0fgxgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 16:44:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HGiJXV012299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 16:44:19 GMT
Received: from [10.48.241.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 09:44:19 -0700
Message-ID: <f9013f01-a61b-4697-a85a-60d70b6596db@quicinc.com>
Date: Thu, 17 Oct 2024 09:44:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] wifi: ath12k: fix crash when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, <kvalo@kernel.org>,
        <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241017074654.176678-1-jtornosm@redhat.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241017074654.176678-1-jtornosm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8GQXwUJsLhJOtHJGmV0To1O1fMklfJ0i
X-Proofpoint-ORIG-GUID: 8GQXwUJsLhJOtHJGmV0To1O1fMklfJ0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=502 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_094426_493694_5B31D3B5 
X-CRM114-Status: UNSURE (   6.71  )
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

Your v3 patches look ok to me, however they are not showing up in Patchwork so
I cannot act upon them. I suspect the issue is that you did not link them
together (the 2/2 patch should References: the 1/2 patch). Better would have
been to maintain a cover letter and have both the 1/1 and 1/2 patch reference
that, just like you did in the "v1":
https://msgid.link/20241010175102.207324-1-jtornosm@redhat.com

Can you submit a v4 that follows that original pattern?

/jeff

