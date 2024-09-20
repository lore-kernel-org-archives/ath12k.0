Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5E7CF3964
	for <ath12k@archiver.kernel.org>; Fri, 20 Sep 2024 02:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xHAAwjjZ/AUGVm2tiVriLYyT2aW+VVtok3pHOwra9o=; b=VURtsS1ynydwkEfnohpA3HDa6z
	duA6tOzb1Q2Mlfo8vJhsNh6ZfS5jS8p0a8GvQ8w9ZPScwFbCwo98lIYq41ZBlRT38p5P+1mhwmOvZ
	XXf6gdHz0jvDiwp57ThusYPvQh9LzouPGfBObfle5FZvPTz94uoeqbA/nArT60J8OSmwUUEqOPl+S
	dZ+LGZ4Z08IQdt7Q1zapU94VsgHANyGhalkqpUYckJR9zrpGF8B/Lz+s4BZZlv48l7DYiufhrTWb0
	sKglm4qJuHhLprh0mJCnGs2fL4DHvnl/LP4if/QZKG0AuSYXfwQ7nRKmO2eHBUbLQKa5f7epciy9L
	tmN5sAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srT90-0000000BI1Y-2bVg
	for ath12k@archiver.kernel.org;
	Fri, 20 Sep 2024 02:13:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srT8x-0000000BI19-2Bqz
	for ath12k@lists.infradead.org;
	Fri, 20 Sep 2024 02:13:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJ3pkO018213
	for <ath12k@lists.infradead.org>; Fri, 20 Sep 2024 02:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xHAAwjjZ/AUGVm2tiVriLYyT2aW+VVtok3pHOwra9o=; b=HhDMH1vbXAHBuxl9
	lAc1778w3QQHF+EUsfd7LJxfP6KZxFIr4EBeJnve6Ab25FKUCX9/B6KzptG35RbM
	YoIkKkraXcu92sYPbAITObu7FHAafi4pIIr2q8uvcRSQVHWWtg4QtMscUP/39dsC
	xDB9+vthsejiqrv7H7GLkLFme1tW2pmq5W7jx3GMeve2kBGy3Tgvdwt1k2L9QblC
	UyvTfKwm2oHBYbgQf7S2kGDK9OvrK2LtTv3888MC8AIO6R81mQ+PM1RSMYmz+K8b
	outXGSiwzXCfxYxpjfOBjS8BXSzp7AXXt7Aune3OT0dOTdP+hNZSY0uUn/7wodgT
	Of+YnA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j6yh58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Sep 2024 02:13:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K2D8Wq032000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Sep 2024 02:13:08 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 19:13:07 -0700
Message-ID: <ede25d7a-ad59-4cb9-abb5-be5fb50b2f2c@quicinc.com>
Date: Fri, 20 Sep 2024 10:13:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k - HTT timeout error with NCM86
To: <ath12k@lists.infradead.org>
References: <14e17e9a-638b-4bfe-8a2a-99b524a20acf@home.xx>
 <1MvJjz-1s0CoP3EEz-00rhmL@mrelayeu.kundenserver.de>
 <7488ed13-82dd-4b41-97c7-5692cacfa631@quicinc.com>
 <6d3f1f33-2a9a-4b62-a0a0-02e65bd1b461@quicinc.com>
 <eb1c8576-bf2f-4ec0-8651-62e97446e940@home.xx>
 <1MI41P-1sn33411oV-00GW5c@mrelayeu.kundenserver.de>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <1MI41P-1sn33411oV-00GW5c@mrelayeu.kundenserver.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _mB3Gw02UM48lGJRfNsuAMtQL_SrnMwV
X-Proofpoint-GUID: _mB3Gw02UM48lGJRfNsuAMtQL_SrnMwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=760
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_191311_888245_3BD62E0E 
X-CRM114-Status: UNSURE (   8.18  )
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



On 9/19/2024 5:41 PM, Dieter Knueppel wrote:
> Minor update:
> 
> I just figured out, that even the physical machine with std. Ubuntu
> 24.04 server (before the VM gets started and PCI device vanishes on PM)
> reports: "Unknown hardware version found for WCN7850: 0xf"
is this a output of lspci? 

could you share kernel dmesg logs?

> 
> Hence the earlier question, whether "MSI HERALD-BE" or "Gigabyte
> GC-WIFI7" is supported, seems still to be valid.
these "MSI HERALD-BE" and "Gigabyte GC-WIFI7" are with WCN7850 chip?


