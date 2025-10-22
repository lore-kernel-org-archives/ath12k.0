Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D81CCD195
	for <ath12k@archiver.kernel.org>; Wed, 22 Oct 2025 03:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4lNQZxYTvh9O9n4SWl7qNzGH/So+jbEvJkWqptqjEU=; b=bDKpST7o1bX92Xl6Z1+NXhbzYY
	xW9yY0vpHrEhkwEyMSmcwFGN4zECYHGr7RaClGAVfonpvbydXtLGi8B86Au0qQLTn42YwS64PvD/X
	aEbJ1IxxH2QaPdmUKUMeW9gGpQCC/PO/MCi7m7kaLsT4p1BW33l5um2frZpIYwZTW/TcmTe/guhkL
	P+IDMYDwustWko1CGkVbqrAcyiHIiCJmyZ6chKWdJ+XE+yNfXofaNQQYYtZi8toCfnawIBLsSHeJd
	+tzHtmXNyXZ0iW1zIcYIgyk2MOtE2Bu/ttYxVD2QeNN66XN0rJjZ8jdyzFKhub0lcZrqjPCPsagL2
	OGSAUZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPu0-00000001NSz-3N1U;
	Wed, 22 Oct 2025 03:52:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPty-00000001NSF-0QGu
	for ath12k@lists.infradead.org;
	Wed, 22 Oct 2025 03:52:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LNGSnl004617
	for <ath12k@lists.infradead.org>; Wed, 22 Oct 2025 03:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4lNQZxYTvh9O9n4SWl7qNzGH/So+jbEvJkWqptqjEU=; b=er4xYD7C4MA0tyqm
	S73ylOcsBNzHvDwPEYHGiN6iOo3GFUE9DjWEdZKSYsac2dhEu4K9Fs786KdwdziI
	BkZX/bFfTnKnkGHbZjn1gXpFTrUbBdIzJwPiN6pHbc5oapTbbagkT9Y+Zl7TCYtk
	QXUw6o8NMgeBaZXYIPYa7N1BorCxkWnUW+bKDdDf/ilWxYbp9hmia6E+8cUA2VUj
	nJc1gSCjQ8gekf4RgWqCOQ4mpVJgJWHKHeWRAdHY/DiTaQ3KOTP7q4lYVS33oG3P
	SGKrblPx/UbM22geYAQ8mkP7afSg3J0tE9YHT+cgnC1Wtyx5MPdbxsyZQjOBXYpT
	IO6cWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkps8m61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Oct 2025 03:52:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-798920399a6so542072b3a.0
        for <ath12k@lists.infradead.org>; Tue, 21 Oct 2025 20:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105161; x=1761709961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4lNQZxYTvh9O9n4SWl7qNzGH/So+jbEvJkWqptqjEU=;
        b=Ur6YeHHkukOshuom30iQPTRQqW8n3/aORrNbmD9UhDG3XJ7LLRqW7qyDsktHzW5PmQ
         +KShbkDI9zaoyInkCLzxWDnr59pMcmnrRpB2r2n0+52RWJgp60tWUuqEHPWsIC+WDp5z
         hDcKiqM07J7oPkpvRDD0l5yNjf3zqsOR0vCdv34gOKOelh9pC7GvQkh6UBH/sFKAAkfT
         hpxTYL6nt5FLZ/Wf4KYnoYlenlUERwZRdKkM1vtjspWrvHC1IFOcvllUGh0nZiRQtnJU
         VcFLCdoutwX/sKwuE5EHJKqXTNPSocPxOkEuurUxd1rywdv94bOrqbP7OMNbyTkd3Ehe
         2zfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+FYH6vOzA73rcHCsbiX8X2guJ5eVuzT78gB4iIKQpGWJCDYzJGNabSJGSz0ceGfGk/FPICaw=@lists.infradead.org
X-Gm-Message-State: AOJu0YymCsTgO5+TJZtimgMUr2oHLpfEb1pGswfJL2HBVu8y9lJcH5dE
	aufBGEDdGzSlAzFLH6u/Foixm4s+WnptnkIP+cjVGNrC75BdoQ+B3qBoIOtUHnzYN3v/eDlC1H5
	+ZRi066tdgqtYnuSCclaU+CJwwkidjKg8y6SyGaFF5yIqMDwSIlm/1aeJRsWCtZGWbj0rS86u
X-Gm-Gg: ASbGnctmPZD3VFZnA/wziPQOmOtcX2OECXK5xFHSTEx1TkdsxFlEGr6BK0QLfESPuRh
	j9wYuBOyY2MVScRhhFO31DYrXPHeYF9HSl/Oa68FPgZczvtGHLEwbYuTXv5/W7gE+iU1gZhvoko
	mBlN2efPAXdtfGADriLzIgp4x1iHtrMJE0hNouSZhJsSr87efEt3mYtMQy47npHU4xFGt6BYLH6
	brMYlKVvGTYdleCqRvu6B0vgelbaita3VL8ux99zmcyd5OR4wv17ZU4YUBMtp+BUIk0qVoJdFDU
	YbsBxqXNGmaHpBSvnTkPRaP3NWkZlwAVLJHHKU5wApEv47Op9xGGGqFYJMKsoi3lbOnSmJmi8sj
	uRvcOmF1Z7qbdV74z65Fk3zl5hfT7CPabHLsZQTYfsQEPwOhjnA==
X-Received: by 2002:a05:6300:83:b0:32d:a6c0:15bb with SMTP id adf61e73a8af0-33aa84d5528mr2511517637.31.1761105160728;
        Tue, 21 Oct 2025 20:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcaIk2TcrKaZPEOac0RHsq/qk84nj24Zjolr88lhyZR5q4OPREXggBrxHIXEqqlc+L6kwQzw==
X-Received: by 2002:a05:6300:83:b0:32d:a6c0:15bb with SMTP id adf61e73a8af0-33aa84d5528mr2511488637.31.1761105160232;
        Tue, 21 Oct 2025 20:52:40 -0700 (PDT)
Received: from [192.168.225.142] ([157.48.122.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3704f6sm1928087a91.2.2025.10.21.20.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 20:52:39 -0700 (PDT)
Message-ID: <ef3621a8-439b-4544-5fb4-4b46c411c526@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 09:22:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next] wifi: ath12k: restore register window after
 global reset
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20251017-ath12k-reset-window-cache-v1-1-29e0e751deed@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251017-ath12k-reset-window-cache-v1-1-29e0e751deed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX3iWW6oAy396S
 ygtFSTQColv7naEw/0os9RzvXSHPBkHyVXb1McoePqz5FjZ0W3Mh8d2Nd+6Ye2rUA1gEQbrQKWP
 sSezos11quljxFwx4znTaAItoN9Qp31T4f2JN8Ze4SIprbuGusMccHi6teLI0O4CJOFY+K9IV7l
 kgRPqXMplLYWrPnhpDfrVXYkHwQ6Uc2OYwbkUOhRjcaYn7AbsycgbuCmTSPclVkRLkDBXKW4She
 quyqISVmf0LRV+ssNs0cnGRq53NWerx9LnPi1yeY6lCav1h6M2AuOM0HdZOVivIQYDef9wT5050
 q2l0XI3Do+GX+T8F4lgZftXmsmVsPL5snd0IlaCwpnHVD0h+FWf0LXinIx/5cT2CWQeFyt37dzt
 yPBTtPZ0CObb0SkTvRBoLaYTZ9kLbQ==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f85509 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=MVWiM3nRykcdLg9H6cDE8w==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EdpZZhp6GymIZaHJM0AA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ISNybGkU9RGEjefCRrjuS1nUKOm0rx11
X-Proofpoint-ORIG-GUID: ISNybGkU9RGEjefCRrjuS1nUKOm0rx11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_205242_148659_3DA8A278 
X-CRM114-Status: GOOD (  16.40  )
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



On 10/17/2025 8:06 AM, Baochen Qiang wrote:
> Hardware target implements an address space larger than that PCI BAR can
> map. In order to be able to access the whole target address space, the
> BAR space is split into 4 segments, of which the last 3, called windows,
> can be dynamically mapped to the desired area. This is achieved by
> updating WINDOW_REG_ADDRESS register with appropriate window value.
> Currently each time when accessing a register that beyond WINDOW_START,
> host calculates the window value and caches it after window update,
> this way next time when accessing a register falling in the same window,
> host knows that the window is already good hence no additional update
> needed.
> 
> However this mechanism breaks after global reset is triggered in
> ath12k_pci_soc_global_reset(), because with global reset hardware resets
> WINDOW_REG_ADDRESS register hence the window is not properly mapped any
> more. Current host does nothing about this, as a result a subsequent
> register access may not work as expected if it falls in a window same as
> before.
> 
> Although there is no obvious issue seen now, better to fix it to avoid
> future problem. The fix is done by restoring the window register after
> global reset.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

