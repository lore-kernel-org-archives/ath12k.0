Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF76C5AD49
	for <ath12k@archiver.kernel.org>; Mon,  2 Jun 2025 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk6rWolYJemBdD6MBou1f4X5j8FMZQ78Fl2r0hRpViA=; b=jzfqSK3RgPbbl2hN1jIuDvYcAj
	JtRc0XiAFps6TtdTIafi32MZI5SoykvfGbBJDKCUe2mnqEdcrBQg3bABDGKiqLH7UMNg0TT5GQVq4
	UW7VhWUViuDMoADBiAtfqeUynZVc82nceK9OVdoU/dDtDpfnRgKBjPJEEV99WnLfw8+kwHjeB75dW
	/3OlFqu1wYKtzOVAT2/bKFeayv1pCr6bjL9FQrCOQ9xkmin9WfBOSTlYOFncSvqd19RvGdwmK42Fz
	U0rSAM0DGpPQcDdvWWOi/FGzp3sTsOtQGk/RndXXJr9K9ttpF2CxZxS+yl0N8IGzAKFyGJc06jV4w
	mbQMN9Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8yN-0000000821L-3JlU;
	Mon, 02 Jun 2025 17:29:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8yK-000000081ys-2AkY
	for ath12k@lists.infradead.org;
	Mon, 02 Jun 2025 17:29:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJjY0007552
	for <ath12k@lists.infradead.org>; Mon, 2 Jun 2025 17:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yk6rWolYJemBdD6MBou1f4X5j8FMZQ78Fl2r0hRpViA=; b=d0ZI9LcxWQwGVjb5
	ZzxayO9vhGgOSityP5EMUhE2bOQ2Ag8vVmpYtp7TCPYVtIV96VNbCr5XucsYBc5O
	2oYDSW3n1+q/lark50T9nlm63fKkrotNQ24z8jm5IajeoPhoJ29zsereTylHwr6V
	gDXc2RprcKuj9o/v2Q603bu8nCir4MEwgYQQ339f68vkdS4jsV9z4is6v98VdLwh
	vXN0k/gFVwdet/jwxIsvNLuDzWXdKPcX9THq/pRsIJnTZ7bAlB7abGwUS6w2sJG8
	OKwacRnSHDyXWhEt85cRu48A8N0HCvJcSZ6cqhFbytcMDzJDukJ6qkFk6NTqQGS4
	Kd3GHA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t80pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Jun 2025 17:29:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3119ba092aeso7479705a91.1
        for <ath12k@lists.infradead.org>; Mon, 02 Jun 2025 10:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748885353; x=1749490153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yk6rWolYJemBdD6MBou1f4X5j8FMZQ78Fl2r0hRpViA=;
        b=ugi2GnAtz1cS5R2yhOhurQMSMKxTaZAB0r8jb8oxsfCSOnDhMU5EDYdR3QDUQ6y8xw
         Ng7P5dQt4qN/+Ga1qNsOcmtmIAVQHT18mHo1gJVOhGKtC5tiMcwgsynnGVG5YVaiRhCf
         G9l0Ul6DjK00CZbSdqNos1zC9J0st7h8nQD6M45TrUTedVN6IGVLoilxkCwC+PuRShla
         iC1yanr5HRI7VaI1kD+RrowcqVkOWo4GWFPxJ2+LLm8PmEq/nlW5k+4VnOPm+N/7CssX
         AvefRyr1MHKw3K4bDDL4ZTljnEkcutiMsMFgpzHmX1hagMrO6u1NqQNXnZ10+CeVgL4c
         YRaw==
X-Forwarded-Encrypted: i=1; AJvYcCVcNxXNQQWmYkHIAv2WCSi5RlyXY0fzUDREX+qgx37SYsnMor5YND3BHPROHopDAf1vZ/wdsG4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yztoj4neAwgS2r5kL+TQsq62BjQIPoSXg6CreCM8PE8TqVupSuV
	FyU3lq89X53IFT0jFiKiE1g2V9ZYd17BXaa9bXZxm8uePNXB5hhaC1mpQFOolQUlQ8caCPQ+5bQ
	3o08P5tnB2uUXh7T5t1NqHGkolVMl59QMHZVMITWHzKKdH2YHy+QX3TxLc3SFDT1WxcQsn1BP
X-Gm-Gg: ASbGncvk6ouxNTTzPAYFZ6T0WvkmtFk3uoKDkOSLWV5c2zmS/uNt/LP/C5WG2/vHXbs
	RVYfaFKSLXRtG5wRrjS1/BJEKa0gJZ2LMrPfy7vJaliWVX5t+fFwT16fZ6Zrds6oVhmyWi94+bc
	5cU9B5yNsHkrRRKtF6jnW5Ey4qVB7rcLLLXrVKriRJDXkx+mlQ+6hkWNYgCraDLGrcrn3DEErj7
	YmdHt2bfPrNPUmIEjFCQVrUzyj4syH9QEtfdipgJRCw9H5du5S1rzZO/Cc4d49v+Y6deMhoIE7q
	QVUxH3+b2INeLwDuHF/V2lk9HTblaKdvPdLte2gcQgfuwIBud7Efz5iK8IfFW8cnikCmtw3KKXn
	3wZ5/eFf4mdyQpY94a0X+r+WV
X-Received: by 2002:a17:90b:2f0f:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-312504538f3mr18840624a91.33.1748885352938;
        Mon, 02 Jun 2025 10:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfUrJsmpLDb7QMJI1xGYYommWJtFioQaO7nwSCM0daCXy1FJ1+DBp4tUsZwOFxjlScDulTyA==
X-Received: by 2002:a17:90b:2f0f:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-312504538f3mr18840587a91.33.1748885352449;
        Mon, 02 Jun 2025 10:29:12 -0700 (PDT)
Received: from ?IPV6:2409:4072:6d38:213a:f95d:ad03:27f3:e9a5? ([2409:4072:6d38:213a:f95d:ad03:27f3:e9a5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c13ffsm5828869a91.41.2025.06.02.10.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 10:29:12 -0700 (PDT)
Message-ID: <3290279e-c577-5c05-1f4b-ffb3078d004f@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 22:59:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: disable pdev for non supported
 country
Content-Language: en-US
To: Muna Sinada <muna.sinada@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>
References: <20250506214930.3561348-1-muna.sinada@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250506214930.3561348-1-muna.sinada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE0MyBTYWx0ZWRfXxNWodxT2/yL1
 dNN6//Fd9uylD+FC+IwVywbyT1AEaK9PLGmZTxIz6+nC069WsjnqT/pMl+OmoneRFkNBUr3U6tk
 BEw3dmVz33g5B9As+Jsb6bC4/8lhpKXZJAvPx2sJnxWkbIzwrgCiv7sVMWuYff0tL5k5QPFHWGi
 5hON/hIIPXkn41fsYZgYsPTwRB0uldCSP/H/9cSaKhjOhkT8aTDhKbdRm9gK7VUgZ0Ay/sBvJnE
 F6di6u9CrKbxtbvW2Lr9L+zRnPR41J0PIUSCKZzDeXjuHUslVrQOyC8Dr4SfTyDiXg/CqBPcWpz
 bVIhrbvnULFRxpqtBktRbEPWMXZmlHQRo0dKf0Gq/fTZKFxDhZfQll95mqoyyQ=
X-Proofpoint-ORIG-GUID: 9lNRC-pMZX386wER66-VUBQ4oSGR8WVg
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683ddf6a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=j1_G22Jgsno5ajverhEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9lNRC-pMZX386wER66-VUBQ4oSGR8WVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=663 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506020143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_102916_693941_9B25D274 
X-CRM114-Status: GOOD (  11.37  )
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



On 5/7/2025 3:19 AM, Muna Sinada wrote:
> From: Karthik M <quic_karm@quicinc.com>
> 
> In MLO configuration, ath12k_mac_radio_start() iterates through all
> the radios and makes the ar state 'ON'. Even though some bands are
> not supported in certain countries, ath12k_reg_update_chan_list()
> tries to update the channel list for all the active pdevs and ends
> up in the warn_on for non-supported band.
> 
> To prevent this, disable the pdev when the number of channels across
> all bands supported by the pdev is zero for a particular country.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthik M <quic_karm@quicinc.com>
> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

