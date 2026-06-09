Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E94FCD8CAA
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSU/vrqQx8ikcCpgUp/sBgUBKKpDN58VUPNhL9W1xXc=; b=ISbhKXVlbOnNJ9yfW+NlYZQilP
	EfMxuVhC4422SA06lSTPp13bJIk4mBWU7SDCgA1a1ysu2sCtx1eusSgm4ZDV43IryHpaUJLlG4O3e
	V15GAN2keqFHHSH+y1xGTpNCzKnaSN85BKwlGr+ukZigwop+cIY8ZSiVOFD56YyMAMs6PwDmeHK5Y
	Z6AAcS3IN5KEqIRW5cYnDEUYX8+xpeg9emQId4Mn6HGLQynO5KiqzxqjVyCwSzYsy0mHXNuQV722m
	5bksm5we9VPVNt+nUPLrY/W7oDD1mY++SOq7zAFExup8DcBnNl2li4NPjxxT530nsbAaVUZkEg03E
	zgic3okw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvH-00000005iGI-49Uz;
	Tue, 09 Jun 2026 13:55:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvC-00000005iEf-2fc6
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 13:55:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnL8R2668542
	for <ath12k@lists.infradead.org>; Tue, 9 Jun 2026 13:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSU/vrqQx8ikcCpgUp/sBgUBKKpDN58VUPNhL9W1xXc=; b=NBTTHkYeg+wTkAS7
	bEjlyZsPqghlwq4NUnqLbfOk7ifMNQLPEgkPynmFkhIoryQSIWvG90sbIqLZ5G/f
	fmGUElC8d588a3nA0nEwPFreNDTsuKai6shBs/Uv/NYtvIJI3Mim3pr4A6qeYkXh
	w2ItIv4cu+gmvo6vLt5cx7V8WPK+RQg3ElWTVH21Ys7VQR//1AUXd68twg1Jznj9
	qTSDLnnEDl9UQgq4pZ4A8dFEjDrkCzDo/QwFdQw3XxFvNQ+tzAhnNCx5isrhDW+o
	f7+eVF8Mg/Tm74NOyCOuOdfv44tOSQp0fNtdpTQy36aL+MkClNk+7BtZc/aka/Os
	DTctWQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25ss31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 13:55:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30762d67a64so7881527eec.0
        for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781013313; x=1781618113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSU/vrqQx8ikcCpgUp/sBgUBKKpDN58VUPNhL9W1xXc=;
        b=Sa6aZY6RjFL5SZe10AUmj7SFMolMiis63oO4ruCqSpaX3YsEuwY5P15r3fh4eOQA+H
         MEDnwcV5nEIqSD7CWzXv/4bEn4ENo7Kx8d6rIsiKqcVzmgEVIXFnOCrH5VJsPJ8kFGVO
         bCg5VGsl9EqPajXN0jYRdJzJpP9JQuhjnOqVUSU7CAwY89Knfs6iOL0GlsmTyzxl+aiS
         kVxSgYKsTmlBNt2bcKSxqke6VqacNrFwBHWw+x5xGeJgu4ojFcQ0/NRX4H+2cBGh9jiU
         1kl9zWzQ5HjAvzs+FQzd5514Ln5AKapKlHE+xr9KhKkTxxQQMSgiMu0kq8VLaWFQC1JS
         AMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013313; x=1781618113;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SSU/vrqQx8ikcCpgUp/sBgUBKKpDN58VUPNhL9W1xXc=;
        b=q9Mz4+EK8kMgBw9L4ib8zP4A1Rppg7Hyl9PYAoIm28n6kXXxV8fE07NgE1aUrhcD+B
         n0pIUIzhd7EQmOBAlTBgU1494CL3I4fyXstI9SGMBulikh+rsRL3MznJvigdGW5Pk62C
         G0Z4EHzWLtRxCTpQw5NF4pV8cH3BYopxwDqsz8lGjBC4F4/vpqRKPyXXiS9ox0+S8oos
         3370hsE+328BAlFL7SdFg6OdUo5HZCT9ekDYJL01U9bfCg7nvN6VjmQYMKCVoli+dUQ8
         n+ak7j/S2zmbXmggUUcU1qp+INSpqxaXPMKsCOgaDTK3admXekaIi3g+t9z5UucI3XZC
         MuPg==
X-Gm-Message-State: AOJu0YxUk5YpsiSTbpejzx8dheQlnnyKpIPCd5HRMyupR/piR5q7Hfdb
	MI6QOSZERdI/vCX01vItkh2E/xRNuqwyI4tz/qZ1oW71rQ6WhSe6weMigHbdwyfAb+1pcf73mBg
	AgwK1UWsFGppU2nXBX+dmceBOWKANF2lD17VyXVs3ooj9bcz6su4E2WcbKb8bO9YKQmokjhAm
X-Gm-Gg: Acq92OGNC3FfhyG30ARfn1wszuBnllEZOKQy9LTLx0w2fCwiCx2snRlaBWbl5t/TT3Q
	HixzI360snidf13H8FPOj4/Y2OjQ28NufFrOGIbAi1BKP7x6XgmGkRb5zIzrGbaHUuReShaJ7jt
	Aox7vi0F7RFCZkoEiSBfuQElovc8Zm0XDx17g8HXEyvFlnqMuaURkVmYxFMpxIdhTQdsviLfqcX
	3GDeGeQjLYcNRZ7G8CzCi4byR9iW31eLn8eSXI5mmY/Lk8aMrJfWd3FsRpr0Vjup2cP96L0QTCK
	Jv8818+vIVsdNLkDdGR2CS/4R5X7fRowiKc3/l25jmqB5VsAg4hJb+vVFY2t3AbrTnZN0Wl3YPG
	upFxJCupbnf71Y791Efs+nsqjnP3ZwY/S38upe4aZnizfza7xATxhCNk2n69wpxRFW+xfv6sk5a
	tuxdbbFy+6xLM=
X-Received: by 2002:a05:7022:b9b:b0:137:f958:c072 with SMTP id a92af1059eb24-138066dfd6emr11400481c88.20.1781013312615;
        Tue, 09 Jun 2026 06:55:12 -0700 (PDT)
X-Received: by 2002:a05:7022:b9b:b0:137:f958:c072 with SMTP id a92af1059eb24-138066dfd6emr11400445c88.20.1781013312004;
        Tue, 09 Jun 2026 06:55:12 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54c9c12sm15289555c88.6.2026.06.09.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:55:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20260604095831.2674298-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260604095831.2674298-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: enable
 IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported
Message-Id: <178101331075.3249128.13745050048351876342.b4-ty@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 06:55:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: IvA8NaT7Q-OPTu-lbzon4JwE2z7jccz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMiBTYWx0ZWRfX2ommcC4iP5Dp
 WzPPXxylQQ3pRZIp9BMCTWxOtMOzFma8jGdEimiZ7Yw4gUNpRY07hYTtnWt16eDwrxfrQq13ChR
 IQx1Guiw3cDdP4/ANRd9naXOdKaIaJaWJ4IqadBeLLrZpWReiCiZKDgSeTjLHgoAV1opSd5A3RX
 Baek3U5RLox3pIIMWwHcRSGAzva3vIGvXAnlby8cHx4movYf/aUUl7m72/wyfVaFdn5xzh6YR2Z
 OjrZ9UX9wv7hCh3CaWgynxMKOm1jOhltr39oogtXk6RtdD4aMBabXTvzl9Mh5w3yrXn7thN4N/T
 U33tvJJeP3Lv/wPupuCwheOeXjC8Z21+7X9tKrJviKhGSzx+393Ce0kJVvG1Z752fBHYuX7mIXB
 RMYG5abBpKs89Qt0UqQI6ZMd3Eq04yrHSczDxRVgdgNbLbwuGt0Fgexkbqa2RiRK3fIDZRF9Gaz
 46PYdq1ub8ecBy9kWqw==
X-Proofpoint-GUID: IvA8NaT7Q-OPTu-lbzon4JwE2z7jccz7
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a281b41 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=R7FzeaxWUBe8q2FKhjAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_065514_887323_E4DD5675 
X-CRM114-Status: UNSURE (   9.51  )
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


On Thu, 04 Jun 2026 15:28:31 +0530, Maharaja Kennadyrajan wrote:
> When firmware reports NSS ratio support, SUPPORTS_VHT_EXT_NSS_BW is enabled in
> ath12k. However, IEEE80211_VHT_EXT_NSS_BW_CAPABLE must also be set to make the
> advertisement valid.
> 
> According to IEEE Std 802.11-2024, Subclause 9.4.2.156.3 (Supported VHT-MCS and
> NSS Set subfields), the VHT Extended NSS BW Capable bit indicates whether a STA
> is capable of interpreting the Extended NSS BW Support subfield of the VHT
> capabilities information field. Advertising extended NSS BW support without
> setting this capability bit is therefore invalid.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported
      commit: 63abe299b12b317dfee5bcd09037da4668a4431a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


