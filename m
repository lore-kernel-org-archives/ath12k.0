Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BA2C44501
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 16:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXStIofx2Ks/Ov1D1CRqtChNqm+QT8Ta8UAz2fBO7uI=; b=iSgb2ajzAe8KvzD4LRM4R2vZFH
	0IXwJHA1uzlJLmDl0XJJoOqVpJcfNsB7PenlbtpzfaH7hHIZbdUEfajzxxS5FJMcx3qwB8uVFcoWf
	dQi0bauvkLMnw2RuAkvSN7v/8jKhYutxXzUFS1ZOAv25Rf8dzPLd6VAl/OYbUbt0vcCSEDveXBmBM
	W11Qe11EwIX/0MT+ybKs9zoerAXLoYDzKvZixUD+LU6mHC8VdtXrq+FI004B+eWJYZ8/zbvXLoD9c
	QOh/MAq4z9Ox/UUJCDFEv6tagvMfasdl8o/osFLHTy+Xnvx5Nqlv8rfoW1ilV13rZ9po9ZIHWW4Gs
	3vUdel3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgPL-0000000ChWh-1S8e;
	Tue, 14 Jul 2026 16:54:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgPI-0000000ChVy-1CDI
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 16:54:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6uCu751047
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 16:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXStIofx2Ks/Ov1D1CRqtChNqm+QT8Ta8UAz2fBO7uI=; b=GZpoAOv0HDIAzBem
	NnUmgPGxN5iCJLO88ELx02gAHOmLiqSVvYjdkG58OFf1hxlFkaAr8v5sI/hoK5Bd
	LOR6MZZkKlHLCO4E2cdomAjoGGJU/s1Q4i5KvHQvM489Zk74O/rq47NrZqVKUgJX
	/8YxocjBETJBgGAy8KksNc/ht3b5WbFG85sSOHHHfVUe1944zKPYlip6b/zGfrnk
	C+XGFOlKwH14lmx81NsTSzEM/wfVrMnbBUcNM5EEIdYFF7ZwAheXfOTJejuc6fAU
	uPhzFHPJ21HWLkirPSWJAIjT90E4PMprolUNON6/+BDsCstQmyGzaUnUR0JFBA2+
	2+XEKQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesaapvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 16:54:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so5323604a12.3
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 09:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784048095; x=1784652895; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXStIofx2Ks/Ov1D1CRqtChNqm+QT8Ta8UAz2fBO7uI=;
        b=BWti+EHS4H+ID4yp7bHFIIweSJZItkEI7wVC/n91jjjh2UgZtTuIHLP/ux41hbOdcg
         ulNm8Mv2rVS5JuSgKHTg0kDkLJXo8bStEXfDKL4HtyJHwxBUNybScjQJugpcqFu13aQj
         z9XJfck9y6wo3TDIaJz1d7a5lYhgIzDLR2e1YNKejJ8lXoZrztwGqCcnjo5/v/MZTQSA
         y3EZgkRiAwEOdNXtpAnFUhg6ncy9SBpLQ/hC1lx0ch+XML2KhBR6iNMulg1/wJVrOxYH
         +Fp1rrhelMwNzdkRRyxPxeTwI6FrsAqOlf6yG713JqaDJdDTShs5999k1yxHTtUr52Nm
         bhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784048095; x=1784652895;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXStIofx2Ks/Ov1D1CRqtChNqm+QT8Ta8UAz2fBO7uI=;
        b=BUwu/aCvMXcbfUQU+2wiY6lCEYpIJIAQ39MTIJ7z+cR81CLVoD8w/vvCfEISLTQ1XQ
         mITKmcgj9ABR4Q6EcwCXIrPKagp9/Ty9YmpyKZDibAXza0d5KX4q+9bYmPLI2Q3CHo7Y
         UTLKBAR84dQ9BPb+mFVdu1Q0ZmswL/XAg4jyWu000mhIQuOvnYiWbww++RdsWjWCOH1C
         IQf6F7MkU+b5q8Fbk6KA74cPOCs3rI5e+SURu+MXFGTzkZoTILkLq93TK7uSPybqnQMl
         60aOKMeeQQ2oRdeEJ1KZXM40qBV6uVwW1qbml/dLjnfMz7oLC0nF/CYvyfwc1W0YgdZo
         bYkA==
X-Forwarded-Encrypted: i=1; AHgh+RrA6zBqZO7j6YAIrugUXX58G5aFmh7RGR4OlPaWWdQ6TQ1cBJ+qdDl9Rv9ucUhLztcoRmGZnQE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvj5P7rb/jHl6qne4epWsH1zpl/xSI+Kw+KWl/yRc/psWoTJO0
	4N+COZ8jNJ7auMHGu7/UU+PAlbguoY/cUEWPKmFRu2CiHhGU538PZTCmeFFIpTIVX9HcZ0xzgmS
	YXQVB5tH2sS4wCR7x2QBUFhJzwj04kHJG/F7rbtmkTZICjT0KUxWoh9Si5n20+KcHjL0MyQTz
X-Gm-Gg: AfdE7ck92265NyEr3556miZ7UWIOeFRwlI14Q3YkjGNtjfTQk0WpxK1azUVt0GzUaFq
	fiY8cnbaysPcnz+E2aZRu/pb/vA5AldA7AyWV2fygvu8GtagLoO7TeoACPhMayE+13z6byyL8D1
	NM504bqyMfzi3pPj45O4hYiayk/0yH7eKXRjvME4ff73zG8Vyye7/Cght8elrsJRbh0J0wzLJwi
	9yzWPK+UEpqSH07Hs82K/5AU1P73Sm5f0JuSES3bSLhHLcWS/XyduA8yGxz5N+KdW+aDn0zY3Ji
	J4Lg11XMqhnUu3nSci8PVUBnW+nVY0TKW6E1whcNsEJzFVZ57UJyNvcdKmb+sdCzOJ3qqQcFRG9
	vqJjkI0u9jVXxAnkJWrMJT+q6A/TKol0/f8gdwByNWZbuVMB3I5wWta4=
X-Received: by 2002:a05:6a20:7283:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3c110007a93mr14875210637.14.1784048094911;
        Tue, 14 Jul 2026 09:54:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3c110007a93mr14875189637.14.1784048094441;
        Tue, 14 Jul 2026 09:54:54 -0700 (PDT)
Received: from [192.168.11.107] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm83472151eec.18.2026.07.14.09.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 09:54:54 -0700 (PDT)
Message-ID: <de1e6499-b3a6-49fe-a2ef-cdcf57438ef2@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:24:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Set congestion control max MSDU
 count
To: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260622062614.760166-1-thiraviyam.mariyappan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260622062614.760166-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3NSBTYWx0ZWRfX97HuigxIoX2q
 yAaINo+xG8j4y+D0Y+9wj8Qq6A9ZeKU6ZrP2D+p8ICxsFbBfRnMUX1OKQO3GO0yWHBlAWV5kTPE
 1KIr3WPp6BX2wliMh+mbpeHUSTMEQG8=
X-Proofpoint-GUID: 0EePd6pOrz3LuJX9ARMbkS30NsJjweJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3NSBTYWx0ZWRfXxvAIRx+4M7n9
 IQ1sKipiYIBV35wlv3nK+LrTSkGlyLoVaW8uZDBrA75N/cTigUeQ9CseH8O5HDDydj+lbV3etjV
 xejlkeX7cUJC+fx4hW8rOsUOaop2rPD7holAOHBHGF2k8mA2SDC7/JkgtcRL/v7fRqAmUd1Ktos
 eWGeWaVQjqTHvxNn1iEmfx3GbdfickJvteDg4YrK5fBwUF3KnZTBeIioIyx+a8F7+9rhwSo3ih0
 g5WiKW8gLRW9S2Be78cXd7wCICVutMXhYqz7WqqcMiPVDeErsUjQZwAIgLxPBenId4ChvMy3LBO
 Ipq4T3+I84GxChcTZSJKVsY6hWOkcT+cyJniXcFhXqyp17xs/Zf9vS1hua61QL3puv1PELsDD+B
 ciG3oSoDh+fNeeXSBJFzXm/2QIcm/ywyYqXkx9D5CWQ4qSfhhk/8cuKZ5mOMeK1NFBmBaqlyCWr
 oOlYqSXUvi7Zgyf1F2A==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a5669df cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=APCbmnoeBd6G2hkCapYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 0EePd6pOrz3LuJX9ARMbkS30NsJjweJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_095456_342895_93B2352E 
X-CRM114-Status: GOOD (  11.17  )
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

On 6/22/2026 11:56 AM, Thiraviyam Mariyappan wrote:
> Currently when running 128 clients UDP DL test in 5 GHz HE80 (NSS 2x2),
> firmware uses the default max MSDU count (16K MSDUs). This lower limit
> causes the firmware to compute a smaller TQM drop threshold, aggregate
> packets at a reduced rate, and results in increased packet drops with
> TQM drop threshold as the completion reason.
> 
> To fix this issue, set WMI_PDEV_PARAM_SET_CONG_CTRL_MAX_MSDUS to the TX
> descriptor count using ath12k_wmi_pdev_set_param(). This increases the
> TQM drop threshold, reduces drop events, and improves throughput from
> ~722 Mbps to ~1060 Mbps with 1200 Mbps ingress.
> 
> Add a new HW capability flag (supports_cong_ctrl_max_msdus) and enable
> the WMI parameter only on supported platforms.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

