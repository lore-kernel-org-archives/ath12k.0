Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE37C021A4
	for <ath12k@archiver.kernel.org>; Mon, 24 Feb 2025 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQBYdPhhbnB3jImt8Dp2qnMIdXjmOPfbLJGI/8anEKc=; b=OSJAJD3SXwDxpl9LJqJ2RZpwnX
	OyfMuuf9a+y+1wVa/s2BK4dDt+tLsSXGgEiIQRWs3TVJGzwCcNyh0LaPezVCzSHucKIIiFz3nI77T
	AgDRIlhM/TwdnkQ1+s2jTkMMkcfFyjNH765Xms7B6k2cbhJqwndr2k6yTjw45vy8i0JcOozkzfDGK
	aXBXehNBho4Bfqu9g3zEjpBeY5wJN2enpMU7XJKONA1SDq5z3mB7PVTuZsyaGzQ6UABsd+g+sJsqq
	iu7P7lGuk2TsjD5UAmdJ+DXPtXsXhBF3GRqE69y4BnHn/L5K+0I+yh9tUd2MFx6v643ETkUDb/ct+
	DDr7XIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgNq-0000000FHoB-1LBR
	for ath12k@archiver.kernel.org;
	Mon, 24 Feb 2025 21:53:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgNn-0000000FHnk-455H
	for ath12k@lists.infradead.org;
	Mon, 24 Feb 2025 21:53:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OKOHuM009094
	for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 21:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQBYdPhhbnB3jImt8Dp2qnMIdXjmOPfbLJGI/8anEKc=; b=liJAnpT2oDk2F/wy
	XhdAAQElgmesicgqrTOYw1JoiaPNp28gTje4MbUMyHySzwEltJ0K/7e1LJELPr7o
	quRnV1V7F9gtlq2kgRbQiZzqkn28MdzHRwhZUL22uwTFe628SnmdveW7iv8K1pqZ
	0Pwe6iDV05M8uBMZfwYGvZ53QPpU48/vtPES4ujFn/S3KUXADBww5sdgdsOkUaO4
	nj5buVPck2prLIKmKSdTCyq2RXoDZz5WaXy3ByiBSE8wjoIuc6cniVO0EhE8q/Mu
	2q0E5aYM8wlSeSSCem1VrTFDUrC5op/qpPj3RFQYhaHHOMs07ASHhmFVF0IQl2nK
	4L0IzQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6y6pkt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 21:52:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220d1c24b25so94627735ad.0
        for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 13:52:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740433977; x=1741038777;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQBYdPhhbnB3jImt8Dp2qnMIdXjmOPfbLJGI/8anEKc=;
        b=Zd7S8VIyGQqATwdRiGjPy/th27pExypWI6LQbg/kyRV1t6T39030mYJmBltDeAuP72
         /FTmDJtB9Socy6mbhbekTL8p5TKRrKAfUNnF8wpFOdkPt+kiUXmMmvRjOAE+RE3w1Xiu
         NTDrXjdnULGdCpH39zH2KVnBwO5n7UeZ3D/5Mg0fT/hqB08CcoKhJQNWqgnwRlFnjJ0P
         Th2PtpzQwaUa9esj9CjF7a+d+n9CJ3AcLduW0MZFeY7LOWOVW1ppN0ZuF489bxzjn2Ha
         sojKC8DhJGR/SoD1wA+qs6nNi3dPYIqtSx2GMjsqIrT8QcAgiOXaB/cAVwmK9i6J928V
         65mg==
X-Forwarded-Encrypted: i=1; AJvYcCX2UGauC01zwRzNTw9lJ88Q5AQ//7S1uabaixXDcuObi8IQDWp9YtoQrqVEzRzOUo/IE8EPJEM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvLEdSiXlZfxBr+Mo+ERxc9Wl1rhfza/BcG6Cjh5LzQvf8imC5
	pnFRWizoPOs7bSbZ5oaNcYBjRw4c1MjV13E2Y8X87GFE5sdWjlK99ucNpLyNtqwDj2lf82COC0P
	TYtDUmC5ltdi3qKZ1SJa/nCx+7yzIHoXAVSon4e47zg/x8vKGwAY/9iyBcfrY
X-Gm-Gg: ASbGncs76hv06E9mlfyo22jqPWbgv/4WQiUGGsOaAHV0XF7k9PwaiYx4MMeSTJe8wUI
	WXl/0Fh09ey7lJY693un6ALKrISGPD/EYMRBJ7Mo51tIWAc/gBFfc+C5US7OVJojhlL/CL7OCIu
	iIi6JEiIRdnt649x6wGBhA9RamOotZDyVzNFxFW9Ds8W2h03CfmdEKlsInU2gUzsYe6oSl2ZYvE
	0/T0AiIiwy/9bouno7cu4aylPWa7uO0mJ/jWUi+Nwu8KIv5dfyKDMbXojEKGihRxA7rNrPD1uaP
	8uudEpilVdVUyOkDpoCkYOZ6X6Ev2uUpvvt4fl6Ncm5YiEwEVqneZlgkTYUH3VWFeoVpkJqRDBe
	IqXO5wecv
X-Received: by 2002:a17:902:e801:b0:215:5a53:edee with SMTP id d9443c01a7336-22307b3305bmr11788685ad.9.1740433977398;
        Mon, 24 Feb 2025 13:52:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNxqZXc94agx6zBE8v5M5+d/Jrs5Jq+vJHfdn2uGcXTqq+Mp8dOg69eypZe/0wZ3TQW41qDQ==
X-Received: by 2002:a17:902:e801:b0:215:5a53:edee with SMTP id d9443c01a7336-22307b3305bmr11788385ad.9.1740433977012;
        Mon, 24 Feb 2025 13:52:57 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a798asm811735ad.189.2025.02.24.13.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 13:52:56 -0800 (PST)
Message-ID: <e4817a30-3a71-4a0c-be9b-7979c40c6ef6@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 13:52:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Abort scan before removing link interface
 to prevent duplicate deletion
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250124093352.481-1-quic_lingbok@quicinc.com>
 <44dc86f0-7775-4d47-9058-17cb048cd976@quicinc.com>
 <7ee0f7fd-7a3d-4942-8323-08ff9c4c8915@oss.qualcomm.com>
 <bc54e1fa-da58-48e6-a148-4a980833f448@quicinc.com>
 <183bc4c7-5ae5-4654-bafe-509d7bfbd75e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <183bc4c7-5ae5-4654-bafe-509d7bfbd75e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xjFCSD5MagnI1oreP-KTd2fbvX-401QH
X-Proofpoint-GUID: xjFCSD5MagnI1oreP-KTd2fbvX-401QH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_10,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=922 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_135300_141315_521CB3B5 
X-CRM114-Status: GOOD (  10.26  )
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

On 2/10/2025 5:10 PM, Jeff Johnson wrote:
> On 2/9/2025 6:52 PM, Lingbo Kong wrote:
>> should i resend a new version of the patch based on 
>> https://msgid.link/20250204-unlink_link_arvif_from_chanctx-v2-8-764fb5973c1a@oss.qualcomm.com 
> 
> suggest you wait until the pending branch is promoted

reminder that the pending branch at that time has merged, so you should now
rebase to ath/main and send a v2.

remember to add the new ath-next tag to the [PATCH] metadata!

/jeff

