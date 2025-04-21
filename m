Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E089C369AB
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtRScXxIHm6oxt6nV96BNJpPBcZBVBaxFiOva74/L34=; b=kC5tfOEQAWGwWC7SqARkkcSJbn
	E4ISbz/Jf6SS0LLUqx7DbM8LRIwDfyTvDAvUGpXMCwqhL9yuozEuLq3KV8fLG8MTpwzJCDfMoCuYb
	jssufNaVggbCFydmkHEcTwFo7/kqFo0YyRfpvdUC5DDlmLDoxxpkElzEGq+B8507krtD84S7gzdsJ
	qvMM12pPEmv3mF9ftsbQGs5ij1OXYGhz8SWSyQAEW1eAwpRqgWH7F52K9tjd3Gjiw8+mdY2MEnIm1
	F57zcDVQsjDvqRf0ruE0RuSsr9+a9npQaZiPD57JuipAj+WP8VNNcO0w+SFEkuyt5O/EiHXxqc7BH
	2P6XOuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wBx-00000004wj8-0lc4;
	Mon, 21 Apr 2025 18:48:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6w8R-00000004wNb-0mPq
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 18:44:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIghHo029355
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 18:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtRScXxIHm6oxt6nV96BNJpPBcZBVBaxFiOva74/L34=; b=ZDIniHKnxVIunbVG
	SQU2BDP1upbXg5y+6qmUDGhoPvYsYbSdpoeYBV0dZ07C/NMfWzXNCK1LJUHuMBUN
	aQAdI/IL4fh8MEveL39+rQ2mC+g6o6VlQusA7cbBuWZReJM2EcYPOfiMrOdbwq9n
	4KLk+UChODRUsMlvoWo27Z44d863pjWxzH4JcqsFhszglTbu5i0AF45HofFzYlGt
	7ec0aV/gIIFuERCmuGLjtdSGIO8YKHT4QJomDuqNyiQVJXMNZdVQjAViIQpFcZtS
	7TL4iz0jxbEkdpV77SAhT7nTS2+aSgKYIWCKwZYLVQmcsOCz5reGRmCwZnCSOwd6
	a/ATQA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464478w2c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 18:44:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b0e0c573531so1585625a12.3
        for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 11:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745261089; x=1745865889;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtRScXxIHm6oxt6nV96BNJpPBcZBVBaxFiOva74/L34=;
        b=PnhheIxN1i70+Wuh2dpqEf5uunLw3TnwxjpBG+LPlsQ4GcG51ErSpJUvMp7tRkYko3
         nUHLhKuIAv42mzSqQBxzURscVQcrdEUkYQelRgpW8wfyxWYChfuDe8aEr4J0wtcDKNKg
         2IfDlG0TNuyqsAgTV9+p/o4x9TuRWe2fmaLUDOYgH355WSJw5chpBKIP2Ee2nAeC+Kfm
         2uNCeWr15Iu3vHeeJKe/u1gFEv2EfKcNNt5SSbvbl0Wi2wl8p2my4zYU9W3B74IcMxnR
         lZjrooCouXdUL+79p1LR2mBU+iDOli38UPoWmKxbF+7ag5OCvRx1nFWemEh33a4bZTkh
         WWJg==
X-Forwarded-Encrypted: i=1; AJvYcCUNQcrs7gUbtUPdJ5UxmJR/NyOGmbnV3ux9GxQFv/EU+OCayT4Xm6HEmsxVIKadoOvoWk3c9RM=@lists.infradead.org
X-Gm-Message-State: AOJu0YykGWcZfUGM2eAAChQwZI7EH56wKf0bfKXNMJgabVpNPou5ZqTs
	32R/4xNroiJh1lsLgPzhv+rUVql0bX05iesNpgl1kTnXRZsiiEeUhI4+5JySrnfpEiSuGRwXNsh
	b1wjBYbIoXr2OyCS9+L8WDRDlXb/6g+sN6Q0IJ/Ozri65xIl2FhwppzH651oL
X-Gm-Gg: ASbGnctsbq5W0jCf1i+tEZyQjpL492Rpb3umq2rceVmbTq6jn2bqFj24ERPlnGaKw80
	zoU9JY92XbqOn74YWiUr9aZGbSviCsOwAmBsX3k8WNfRcYjU/zHpmK+AkO/97V8cUmheiczv6T8
	PXFZHlMtBALSdYzBeVhwlik/OPYcUt7D7A4iFlKpFCwUuG9ypNLT0rGL1YG666dqgcdVts9niGa
	/R7ejMeYhH8G2wCowYcghTAdwnleUS1lQG1PYBJeq3PvFdsg8bKWZlWdwShkxM1s/vnQ5VQIpOA
	3fQ5k9uV9W2Lt66Zh2IpyIbgnxBIHd7C9cg4IYBtaVYqlXeBsEl03Dw8qjK07fEI/s9RUFt1kxJ
	sa8Di
X-Received: by 2002:a05:6a20:9f09:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-203cbd60a89mr19672757637.41.1745261088719;
        Mon, 21 Apr 2025 11:44:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA0pK6tF2JhEK8ouZupmBtQFU+yOMOxYbB5tNIrlUqNDVEr9iX1u+Kx1ALJ2l8+cvsKSayMw==
X-Received: by 2002:a05:6a20:9f09:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-203cbd60a89mr19672724637.41.1745261088351;
        Mon, 21 Apr 2025 11:44:48 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0fd23599cesm2989744a12.59.2025.04.21.11.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 11:44:48 -0700 (PDT)
Message-ID: <47ea4e64-cd87-4c42-a20d-f663f197e44c@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 11:44:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: kernel test robot <lkp@intel.com>,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <202504220128.2KvxCzaG-lkp@intel.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <202504220128.2KvxCzaG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tfsn-BoHWCrnHBbld-h2T7FxOeGXg9Y4
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=68069222 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=p4PaQEVxqj5bAbq44HAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Tfsn-BoHWCrnHBbld-h2T7FxOeGXg9Y4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=564 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_114451_383726_BD0FA120 
X-CRM114-Status: UNSURE (   9.12  )
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

On 4/21/2025 10:16 AM, kernel test robot wrote:
> Hi Karthikeyan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on d33705bb41ff786b537f8ed50a187a474db111c1]

lkp@intel.com folks:
This patch contains the following footer:

base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
Depends-on: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>

Is there a different mechanism needed to tell the robot about the dependency?


