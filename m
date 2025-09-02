Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4330CA1005
	for <ath12k@archiver.kernel.org>; Tue,  2 Sep 2025 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTykqxOQci9cuCQLak+uLJbnVHavu2Q87fCNLpbcAiU=; b=af0Mgpif04JE8R0FMY6cxZXHjM
	spqeS/3LY2FLmkpF4W4kNRc6ID6MJWnoXPwKa3wq3hnC8mdRlQUtZTufas7fIPBMv2PZCIai0Gxn9
	tBxXzPEtT6skaIAS+HviBwp5m0rF1E49QF9lNd/8Kq1s/cozrYlQHVKtFCY8Zd0X3IxiQ49mm+HHD
	roaIOGPj8FERjH+Z5k5IUNbXmYX9cc5gYm/vXlWRa7QswKJuwO5ue8d2AvmaBq2GJxRa4c3TSa3hI
	v3pnE3Esnz3jXDomw3tTQBU+kaznZf2xsO+k9urRS+YiQhkKidaAwZaW2GtqFc5h4hh/ZtFF4fiBr
	OhTOH+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6i-0000000HE0e-2Cvm;
	Tue, 02 Sep 2025 12:27:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN21-0000000GHRf-3xGB
	for ath12k@lists.infradead.org;
	Tue, 02 Sep 2025 09:10:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SEO0022405
	for <ath12k@lists.infradead.org>; Tue, 2 Sep 2025 09:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTykqxOQci9cuCQLak+uLJbnVHavu2Q87fCNLpbcAiU=; b=F1YZCZkrk3mWck9Z
	MRp646ZPSm5UPzjYmr8FR9EMUysAO//HbV+19R3bybiGIykFweM66dnjW9l64RFA
	8+wkHmMqwNStoHFr/KLcufmlsxUoQuGOTIs9IKgl9zbJAOsH9z1dYKG+jsWQDy36
	Hsg/B5w9WZ66Va277Wo5gYpV4rTfC3oyR62gC3tw8KkL2a2tcQX58AgR7Z7He3O1
	K5fAuuB8Nuj6WOebaY3lOVPzhz3lw8jY/KmN1mSmE320oTKrI0BXLFvthMGbitCi
	93/tUCdXg22imlqhuBqkzhpdynfXSgyJ9vNZgz9HPJ5ELLJU9WV2Dz7lD8olRcEP
	UM10mQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7cjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Sep 2025 09:10:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3276575ae5bso5234970a91.2
        for <ath12k@lists.infradead.org>; Tue, 02 Sep 2025 02:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804223; x=1757409023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTykqxOQci9cuCQLak+uLJbnVHavu2Q87fCNLpbcAiU=;
        b=qk/Qd5Qn0PbP4yjYJTlrohafIgo6XcDN55dPb8J3xPrdm3I+C2qXvv4o3tHYfgKC+m
         Tu+nRQ/zQyy3Wm5cqa39D14GUjynuFCoN46/xozCREx95P9V2z5+DHN3wU4fBdWOiP6n
         GZEx6hXvlgsrnp55V9jqbAxvRN0gsqc6k3Rc2RarbBUMxrJKxPwLsq1CpzJGnWeRe6Cy
         dENsSeCWaAblRE1GH3vgbzTuLlCesnMv0BR1buHmJgC1RU7bluoTaoADshHyhN4Ein9R
         9D+h4TFXNAfl7CBdSyEaGUsPZnNLGqEu03KIeK4WR3GCZtswAiKNNjEYw/cC52nMRWtG
         /FOg==
X-Gm-Message-State: AOJu0YxZWZHOGq0kDe/1iaMJTZxRWPO0lwMfPDQaD22b5AVqk1iNTqUo
	VRXPysJEFsIOSbiGrTI3SgVK25wpv05zJJkV0Dwm74NKZjDaaCxrFYfG/FHgw0b+JZ+4kd+vL8Q
	Rg1Tf5gmDpy1Lho4yPL9/o5JyU9f64waCnejIA+c5+jXCNzx4KMRcp+rIALYvZlhyRW9kOb/7
X-Gm-Gg: ASbGncuQ6qET4zBN5KJv2NXHvTs+nwd9yw2V/IPAPOEo1qy+h4xHnz+xe6eDn5Jhz+2
	MKxoUS8g8QvqLZRqnLGVvq6GZQWghO9BZkvmNsI8ptL0lKpx0FfedSMBsbEFGfLTzOceaI3MpQg
	4YGnQtTswDrFgk4EYk5WjJ4RSTn8ZqElz9c7UBo/Cx1hEoYUF7wYXsOeEILdq3poFz17GbSGSSC
	BmXXCe9Fo0fjkhLfnf+NHZGi7uDLJSC317SEPokCmnK68UmRYJmjE5H8L8VWSTydowvfV/+0ZV1
	dV0qsi9Z0LXRJHU7G6//Du9MU2X7800p4MQUueMPRutpdpEuPahAUeRQuNDAGQfojtH1eQSxM2g
	yKVEMRDEog0HiY2Ff5OoMVGykJ478mQ6cH5Y=
X-Received: by 2002:a17:90b:570d:b0:329:f535:6e3c with SMTP id 98e67ed59e1d1-329f5356ef7mr556326a91.35.1756804223200;
        Tue, 02 Sep 2025 02:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwcAtldsolC2LHok4dr2QXwi+S0rmkNWRvr4GBayodz4zUyxKi88w8gw/G2m/YPf3mvJ835w==
X-Received: by 2002:a17:90b:570d:b0:329:f535:6e3c with SMTP id 98e67ed59e1d1-329f5356ef7mr556307a91.35.1756804222777;
        Tue, 02 Sep 2025 02:10:22 -0700 (PDT)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e5ad5sm13668959a91.18.2025.09.02.02.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:10:22 -0700 (PDT)
Message-ID: <d0fd47d4-6505-4050-897d-7caa3431a804@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 17:10:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-mainline-6.17rc3-1-x86_64] RIP at qmi_handle_release with
 ath12k on a MSI x870e Carbon WiFi - mainline kernel.
To: a-development@posteo.de
Cc: ath12k@lists.infradead.org
References: <fabc97122016d1a66a53ddedd965d134@posteo.net>
 <623e93fd-73ef-445f-8519-d510d0c36801@oss.qualcomm.com>
 <d8e395e714f33e596884a8f1443347b6@posteo.net>
 <554aa5b1-3004-4e98-8f4d-280440f21412@oss.qualcomm.com>
 <f3f6f31b1448aa11e1ad0862d530a977@posteo.net>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <f3f6f31b1448aa11e1ad0862d530a977@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0VBafFxhI7bSVl1f3zj4MrzCt_JAtA5R
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6b480 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=aEMk5ncwMHrk1IO9AeAA:9
 a=QEXdDO2ut3YA:10 a=h9p-F0r8J_kA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0VBafFxhI7bSVl1f3zj4MrzCt_JAtA5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX8Eij6a+SDmFQ
 Etg5KbOzrLsyukL0F+HZASzTlJRXZPCmbWv61IzryDYuoxczY69Ya00f34EP4KroqtAOU8smyIj
 OaXfeZ23UOqaRq2aF3yDB/CVj5TOBvamn+tkfCZzJfmmkC3Vp+DWAuavVNWnafd6sSFs3YYQ3/p
 PfxGYCXh77bo35b9qVdkANMLvXrP4a1RGdbOmK9QXpb/9aiEudoJKvx0xsgy0MNA0XPXX0I9aUi
 i1xsj0iovehnWs56nQkjDKONd9TV9AuC9KA57lCDEfT3MrPlhamS/PZSfpb4PcJdjx8kHzxDKEl
 Vfblc8rO9/o0ZKQKErfYtzmhI+TmOlA+2Cm81kVAq83+W34U7qAN7TWokdXr8OlU07VmrpgfFOj
 FZJJnTTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_021026_149910_AFFA2E37 
X-CRM114-Status: UNSURE (   6.92  )
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



On 9/2/2025 5:02 PM, a-development@posteo.de wrote:
> Tested-by: a-development <a-development@posteo.de>

Thanks~


