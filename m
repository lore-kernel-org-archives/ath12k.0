Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7763C369C2
	for <ath12k@archiver.kernel.org>; Fri, 25 Apr 2025 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk/JlG5jK1EN/Ao+o/0ULLsaxO+jagFbOPk3W6GsDCk=; b=dfX6QYP3qPw8FmrXaX6WzCT8i7
	s4OCr/KOWU5BeTTDf4tZLMAeG3vMnxS1zgGFhni3/oxWeTm/c/cnRyWkddvHhUuuRgJzTl8hdO3js
	ZNOodCGpysyQO8lZIDLkYXrtINo8ojdrgxi61lWY6/o1XBHNtjcC4RzwcwC3iA41LZPcP3U6YBVbJ
	j9myOidRnyCIzI/dFsWDcGvxHvDGr+eTV1DgU2S1sGSLXplUE+/TdWF8FNeA5qI14Z1JkK9Uc6F0w
	l/rq6mnP7ewqPKg4FPa/3n3JQJOLUxP4JQGkOoV/AY0Uc5fsgtHQMsRA/xbEG86XmVU49hTN7S4Ki
	nFfZ9xtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MUK-00000000KVK-1iRl;
	Fri, 25 Apr 2025 17:05:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LGO-0000000067G-2N01
	for ath12k@lists.infradead.org;
	Fri, 25 Apr 2025 15:46:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T76K030818
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 15:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kk/JlG5jK1EN/Ao+o/0ULLsaxO+jagFbOPk3W6GsDCk=; b=TfrZc44pQ5qia/Do
	aGcsbnHL0gciuxVT/D+zs4PbbtkzCldNl9EQ+03eXtj+GFKrDPZoNzgwzsPO8Kag
	FO21Kac7urCU+S1AFRTzc0NR5q9Rb+wFGfXGPcO78f17XwBEuYWe5hsCTapnq3O0
	inZOddQd62ab1ZZJaYOJTbXUUnGmHHHM/+DimDTGt0FD/88w1zX1Ce3lUD74NeUa
	bECn2csNCybKOMzB+UX9rom5GldCjErxskAyDw75T1hezvYs2cE90TIbsLSI7971
	eaNiu25D3oYk6VMHLU6JzZ569DvIToSdTIcWGruI+NMthQs+EGvMxSZbZ8edY3Qb
	DmVBUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5hn8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 15:46:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2241ae15dcbso27881705ad.0
        for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 08:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596009; x=1746200809;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk/JlG5jK1EN/Ao+o/0ULLsaxO+jagFbOPk3W6GsDCk=;
        b=IxrxzuUSQKM5vHeLZUbG2fP4beSLKv3AsQRUe7fpZRfRuJFU0GWBKD3mcVHKHfj2ex
         lZej1Aa708R5wQfIQzh7DQ5Q2hZ4XLYXB/jEGkvfiujwLkchRnG9IZNURnEBoGW57VGy
         HqA5LaNf1ZKB5bVfLPOG/BJ2qRNBN44M+N/wk4jloSZHqRYfGklG2VWsha25B3qKcMGn
         qvq2BCTW9jgfFciIWmKax7k1LB75189QEW1RZgyIxRzA4FshCgeemwg+WhPZn4mGFzjP
         M7Mg0GlA66IbmVxc2qNTp70kFEIzl9ityakPz3hdFoYi0by8S4kYXFjgCG+2c/FvtvgQ
         IuSg==
X-Forwarded-Encrypted: i=1; AJvYcCWLiQ+vYFgvhMEg9eO4aElnkqiB/5pCGJGGKi41bcMILopcFTxrAisSPTBb0wcUIMHNXxtV8X4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjYw5JJLaepYuVdSpL608elk7XLvCa43Bd6FkD2pukVliwE8Or
	q7TDQiHwSjkr9R92wXcNwyfpP/JzFfhX2/NVgDWp+t3v5W1s/OScruIqakDGAO1QZNAN3+orl+X
	dIhGwWv4V6bo87jP3U2THjSBDyvZLuwsjr+VYfP5ggUL6SWiuJYvCoIqjgvlM
X-Gm-Gg: ASbGncudCQo/6OhU58VNV2TJVHgduQde1H8WhKnMP03scg4pZe3Qg/N086g4JUs1Svy
	xPob+w22BWtTH7aYzdEjHZ1baJtgZw7hP96t9vd8gMxfg6sqLfhdwvs4S5Ac/BZF2ZXmInrBFPy
	+YOTkY2BUc1DplZBIdtmQ0i0bq7N23VzH4cpt5z6CKYU0lImaJgGbyi3k5qyyJzDoNgc5bT48Bg
	e/vIbbPF7EZXqmk+cQ5W4RuL0a4qLTJoCHp3Qdh6bV7dOOzWNu9gxpX6vFF53JNa9FyV0AeSY0E
	JPpNH75wUzGdMvymTnK6m+hnsxzuZcLKK5gXJqaylXAnTk79KmBFeqRLW2rynCfrUjwXPilWG3U
	msysL
X-Received: by 2002:a17:903:1aaf:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22dc6a8711cmr858975ad.43.1745596009602;
        Fri, 25 Apr 2025 08:46:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvHmjNZLntoV8XvGNqIzwDqg8ckNcjVlQeBE1UeRmXlBYhTEON7wSJfvzdebdxlvn8XtjCuQ==
X-Received: by 2002:a17:903:1aaf:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22dc6a8711cmr858595ad.43.1745596009180;
        Fri, 25 Apr 2025 08:46:49 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe4desm33943545ad.70.2025.04.25.08.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 08:46:48 -0700 (PDT)
Message-ID: <07c00e98-5280-4563-854f-5c7a457578d0@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 08:46:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v6 00/11] wifi: cfg80211/mac80211: add
 support to handle per link statistics of multi-link station
To: Sarika Sharma <quic_sarishar@quicinc.com>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20250415042030.1246187-1-quic_sarishar@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250415042030.1246187-1-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExMSBTYWx0ZWRfX0GrqwyKdRIGl 5TWW4sZGHWjsU/j98V+VWRgOhx/rnNjApBYMTw00QWVtr3S8Y9KN8TfPDGNgbVMrC+IYEYSaJjM +aSbey7UOg22hyY9JsYynmVLhNrIm79hMCNNwbvZYBGggIYIH2o+AP9WhlDv+zCDevnFImbCyvP
 7S1WJi113vn0OMfya3+hwA/oxKaEnfmIDF3rSOAFIKf8lPkBd3XsXRkkjdRhr46qBeekqvKPCeh SUvHXkaW41pcq9HiqhyDGBEHxGHnTkd13r0f+d+Vx38merjlQK/9zZZRrT7S8TFre6gaQr7piFS zRNDk48ISVPlbaxCfHyOyi+xHBm8Zv6Treb+NzsLqrssr84mz2S6DFwo2LhAmTsKk6Cc+Ks59h+
 74tHU1iJRe6prsBFFMhlG82+l6XgylA/BI/yc0OK0RU1uTS7aGi7OreFvnJXc6cm2fya2elV
X-Proofpoint-GUID: lQvFVA7jn3G3u4WixACwGZxHS3ad4CPf
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680bae6b cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=WqueRgLFPjDBw-PMjR8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: lQvFVA7jn3G3u4WixACwGZxHS3ad4CPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=713
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_084652_746027_BD6BF3AA 
X-CRM114-Status: GOOD (  10.39  )
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

Just a couple of generic points:

The last ath/ath-next pull request was processed. You need to rebase since
this series no longer applies cleanly to wireless-next/main.

When you post v7, please include all parties affected by this series, either
by using scripts/get_maintainer.pl or by using b4. There are a multitude of
driver-specific lists and maintainers have not been directly notified of this
series.

Since ath/ath-next matches wireless-next/main, and since this series has
co-dependent changes, I am freezing ath/ath-next. I'll continue to accumulate
patches in ath/pending.

My hope is that all of the issues in this series can be resolved, and that
Johannes will be able to apply the entire series to wireless-next/main. After
that, I'll fast-forward ath/ath-next to pick up the changes, and then I'll
start applying the accumulated ath/pending patches.

But I'll only hold off for a couple of weeks since I want to issue another
pull request in time for the v6.16 merge window.

/jeff

