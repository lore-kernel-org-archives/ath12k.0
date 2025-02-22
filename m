Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B60C021B2
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 06:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lpl5ZoF02efgeSliCrYre98MXqIsYsG4xatxHEt7Vr8=; b=gtzH1Nag+toO+LO5Jpa/Ig1/lh
	TwxOUWZ5+2iYp7nzyRJuojgjfWWO18cMwldVAiobfqx+FX/zVE0jd2z8q10oqU/iDKP19CXB4Z+FP
	oaUPTQBF1Ese5FYrbPb9hx3A99HMbGocDEm43iZCgkZRw1qHXyeKd1OMJb6oSsAexR14V+VsuVWEw
	/K2g8fR3RChglV/ohP9+y6GJpIu+RowDSm03XsJSR4ppWBirITOldMiQYF9f8sTWYNpaqFywQm58+
	hNIimKk53+I/HOJU7wzKykbleYIdJjR6MazeesJLwijWZZourM0Mj1p8jx9sk3MCi3Mep848zt8ta
	Vb8BLnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tliwK-00000007Wna-3AUj
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 06:24:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlivL-00000007WlE-1rWH
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 06:23:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51M4mMY9010366
	for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 06:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lpl5ZoF02efgeSliCrYre98MXqIsYsG4xatxHEt7Vr8=; b=UmMvoP/IJjp8u7a2
	Kt3dIQvFg/OCEVTxN68QvqhX+odHV2YV5ObxPqshpnuRxTsnqsvDuGdaC8e8+2Kv
	DDXp0no7Dq0usfPKWlL+uoo/C84VUZuUIdVGMLg95vHg3ag700xJTUeD3JLogQ2M
	5TCT7fjO9238iy2iYTdlfpWID+zJheJDvgKhCDdlLPiWXEU9nlWD1R3X642WJrdX
	WLsxh4NzBkV09J4FYnovB4XqORfPSG3yCNXxZRRSRiEdtxaADcr3Pggf2tS6dlHh
	VVmwD4WHxmBUQN0HKJKlY8IumYO0zrLHfFOVlPNjVVTBwdc3j3LjOrSn9YkKnYML
	Jq5FJg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgg92d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 06:23:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc261eca15so7674948a91.1
        for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 22:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740205417; x=1740810217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpl5ZoF02efgeSliCrYre98MXqIsYsG4xatxHEt7Vr8=;
        b=oNFkjVXTsK+cV5UKAGSNl10+Nob5RdaVkJLU++GeJw2D8dLtV4n6abdOqAXeD5hUvF
         NYukzKoqLOvdhUtrXDtXoV0B8OK6gRkpBIDy0Mn64PE3E1vIEN6nEWwRE8p6Y0LFDZ83
         1CtuYJjtottDEUdKNzVnBK6K0PdkTd3/fihddSCNmBcIXP8/jmZHmP3eIIUmS+mOnQc6
         Hwh5lbHD3IW9H0Jz7feuiAF95gVOoFUBbU39Jobq0lsq7IW2JEies5JIvanE5UPUVxeG
         YBe5WEU0elmJUORkM5UZk6znOxlmvPJTDjg5OZX3hnZ+8796mIKT6BPQ8UAAxdOdxOMQ
         17qw==
X-Forwarded-Encrypted: i=1; AJvYcCVxbHvrSVUtVO6YXhC+ewxycs7PlfmySLhHfmAA9yctRc95VYBbfO5WSiFemTWKR0DqpYmivVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzslgGsRB52spGLYB8aqZzyafKTPF9ujnYO3pobLDZVLQTIPS2t
	apPvcwjfN1sswa4sDFkPTy3pJDvHKg5vqEOFlDsRpQDB5f5+KkaQCTiw1vo6/2DLwMWil3YrbyR
	v8pJOlXMJUScJX3x0znDlPJxRnqoVjT5h9bRLnvaKrDbufE5m24n+5dSq34wR
X-Gm-Gg: ASbGncv5gnSO23OQ4QyBUQdq2oc4SvJXiKbgktDRxS0L5VtdiRvaXFMnP8PWN1fXMYL
	r0J99TO3sDQBU+HqCKCKxrm/kdWSjMRO0k8Xsv/HfY5In4fKDQEln8zv1GaUVvDtmPr/1jSLfJl
	pS46XKj/xu3Gxe9w1/lyPPQxG4ZeEG4XNDAzh72Jc1mqsad5MhQaZjpwE25F7f1h+fzalYO8+On
	KOWpGQJ+xO3CwaPIC8V+BD9ZN+S7y7G18INRukvxkj1DhiUjTab2ZjBsc2RRthgosYbq+GV01UP
	hiS4e0hxZRL+dkuJZDAfsonIZbyFI53h6UMuB7puPyJthKDHBjMyPNpMnHF7
X-Received: by 2002:a05:6a00:8a17:b0:732:6a48:22f6 with SMTP id d2e1a72fcca58-7341410bb54mr13760451b3a.9.1740205416700;
        Fri, 21 Feb 2025 22:23:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1LLr0yF54wR1AauJhnBWfC2bAYzXb0vOq4XHTPwhsjI8+jN7Pit9xBCrL9RD/j3syf/+zPQ==
X-Received: by 2002:a05:6a00:8a17:b0:732:6a48:22f6 with SMTP id d2e1a72fcca58-7341410bb54mr13760428b3a.9.1740205416287;
        Fri, 21 Feb 2025 22:23:36 -0800 (PST)
Received: from [192.168.225.142] ([157.46.94.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73255f4c0d1sm15087024b3a.62.2025.02.21.22.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 22:23:36 -0800 (PST)
Message-ID: <ab394d15-d4b2-3dbf-53f3-174a6ed4e70b@oss.qualcomm.com>
Date: Sat, 22 Feb 2025 11:53:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 8/9] wifi: ath12k: Refactor the monitor channel context
 procedure
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250222033002.3886215-1-quic_periyasa@quicinc.com>
 <20250222033002.3886215-9-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250222033002.3886215-9-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FZPiDDaY4uUdjeAsS4WuP_rY-3pSa4cl
X-Proofpoint-ORIG-GUID: FZPiDDaY4uUdjeAsS4WuP_rY-3pSa4cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=894 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502220048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_222339_599024_F6308851 
X-CRM114-Status: UNSURE (   8.87  )
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



On 2/22/2025 9:00 AM, Karthikeyan Periyasamy wrote:
> Currently, the monitor start procedure use the iteration callback to pick
> the last available channel definition in the mac80211 hardware. This
> approach is incorrect for the single wiphy model, as it holds multiple
> radio/link channel contexts within the same mac80211 hardware. To fix this,
> change the iteration callback to pick the specific channel context for the
> given radio/link. This approach makes the monitor start procedure
> compatible with both multi wiphy and single wiphy models.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

