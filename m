Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3DFCF11FE
	for <ath12k@archiver.kernel.org>; Thu, 10 Oct 2024 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uJIZ8FXxVwj+FxHBvJKLc+h/rcaPPZ02VemKCYj8ac=; b=Fa3fZHT0JCQXnyjWlTDFl+qDGw
	xO/RUwIRPUZ7nI2h7k5rNacGgvLM/887wS0+qlNwW65N16s3rUh7ROrPFSNP0EQAruqC6GTn7QJUA
	BhBXrbr1EL7nUnYGje4yaQK0t7bwJunc/TgYLq7Lh9cWze8yERefYl2jUZS81REmEcfTLHwtQzDsi
	XZiWgaeMUkhFamYtMm9KSKqrxEfUTf0OLalc3+O7FPrq0klPy+6smkjx7T8tGyYb6QGm+Y3BfkKb0
	KbSQflDfl5xnhaNRBmH3eEwv0M5M059R8ad6WOQPtIru5FvTidGrpEUGySt1dNjB7Zp2HWYfIjbnA
	icweyW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syv4j-0000000DKPr-3mf8
	for ath12k@archiver.kernel.org;
	Thu, 10 Oct 2024 15:27:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syulj-0000000DGBI-3F5k
	for ath12k@bombadil.infradead.org;
	Thu, 10 Oct 2024 15:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4uJIZ8FXxVwj+FxHBvJKLc+h/rcaPPZ02VemKCYj8ac=; b=oY4Jg2m0dcfQjEe5ngr4KeeOg1
	vNhsNH/PNhYfvMYHHU8sHPO2+DvQFFFBZ0Ky6P4t4Lh4s7a2ci3vdaGp13jzICC8kyYOsxfOC+GK+
	FY+POnwXZTEi90WCnnQA+8kp87T3BIMOX1rJFxEbsePi+dFaRc0J7xw4EvonA4VIcDIiWcOMUam4B
	93PJuB6BM5DdlfBeueEctu1SXcyNhT5Ye1C1Avk0BqpbdbFI/dWbSm7vJAHCsGGJ1kwoDfgt4u2uW
	/kdmfvt2uR8XE0JFmaZrI333O27GWC0A7dpJ9+kwlUj4Oa1yBL06A3MVbv7dzj6R6p6lTz1nxj1mz
	+ircwA2A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syulg-00000005QJ8-0KOW
	for ath12k@lists.infradead.org;
	Thu, 10 Oct 2024 15:07:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AD8kGb027034;
	Thu, 10 Oct 2024 15:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4uJIZ8FXxVwj+FxHBvJKLc+h/rcaPPZ02VemKCYj8ac=; b=emmtN48eyRmkb1Wx
	RF/POjvVW9AfvoJIDyeyORtsI/skyywDJlYVVCG5S8j8gfxvAVI1QWzGd3vaYtEi
	Ti2h+UMJ+nBy18O6N1RLnMu1/9zrBNDYhh38+9sT+EZfDoI8yiSQdqSV983KyrvU
	x0FbUWZSjOD1dT+UILpFdtp0XSX2hVLEYx1dF12r8wxp0WUQsORqckLm5teJtwVz
	+1RbK14HZVgHnxudfvvC7Do99XokQj3f7IBz/OYm5lPGxc4PRhfSz5KQDIf5uwYu
	ARCkSwCMNSmhLfNGNZfUDdA0gO/1v4ezlAh8NCXwhwrWoZkRf0WgVza0KkVTBOK9
	rGyKhQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426fj6rb5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 15:07:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AF7l5L013643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 15:07:47 GMT
Received: from [10.48.240.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 08:07:46 -0700
Message-ID: <588dba32-52b7-4b61-b208-87c6aff8cc51@quicinc.com>
Date: Thu, 10 Oct 2024 08:07:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] wifi: ath12k: ath12k_mac_set_key(): remove exit
 label
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241007165932.78081-1-kvalo@kernel.org>
 <20241007165932.78081-6-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241007165932.78081-6-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V8QPJgn8k6cGi2cS-4P-e2-hqG1PNMBi
X-Proofpoint-ORIG-GUID: V8QPJgn8k6cGi2cS-4P-e2-hqG1PNMBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=705
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_160756_857048_2DD72189 
X-CRM114-Status: UNSURE (   7.75  )
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

On 10/7/2024 9:59 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> In ath12k_mac_set_key() removing the exit label was a bit more complex so do
> it in a separate patch. Remove the else branch and remove now the uncessary ret

 s/uncessary/unnecessary/

I'll fix this in 'pending'

> initialisation.

I'll leave the UK spelling -- don't have a need to enforce US spelling here :)


