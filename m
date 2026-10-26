Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05FD606A31B
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 06:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9oeKrNd;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Je/S+Ibg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAUrF6mb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/HIFyJKOlRqsffaUB3MiFb99f+rh+OGZ3T7I07VYqgs=; b=t9oeKrNdVnC1f7
	Hu99mkM6WJm7VmsUAIbslYMoSz2H/ua9e3O7ziobNC1RM1+L2GlxcpC3FzsdiKh5lL6GxhowUa4TY
	BzfiY+mp/4mKt/HRxuJJKvjYFTVfHuEKb6lvfRqCaLrCJX1+KFgZIT7QUj8y/DDfz7DNOpPutqr7/
	IP34shHTdPkYVoud/M1ODDlp3TVVuhBm2Upew0sedjt2R4YOcvuFauwvjKUZl5u4UsgiGbIpTbeih
	8mSxqHGnjAl7rFP1GRDwbtkD+HpZjpQSRRNwfVvP3fSeXvQ+Fz1f3UrX90H1+3ZkL2gaeetVsRyAx
	0I54/IGQ3HDMLIvS/sDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDlD-00000001m1A-3S3v;
	Mon, 26 Oct 2026 06:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDlA-00000001m0q-3ZAd
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 06:00:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bKZA2206725
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 06:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/HIFyJKOlRqsffaUB3MiFb99f+rh+OGZ3T7I07VYqgs=; b=Je/S+Ibg2hgqJcin
	qVSCKTGieUFYA4cqFMgz2K9nL3GZIW9oqdzuntHDIlJUfpHK4Slfu72pwKQ6hVc/
	/TXFnhfsCHnCgPrn6nRTgfu34Su9tMt8PVppA5KravgCM3f4oTD9lIXtcRxe24Ed
	w4HmC01144OJBxoxJzrJF0EpGtx8y2X/iSQYnW7vqbCqUtBgVrPMSG1ZRThzqm87
	oevuRJTuF4c86SnyEvUM+kJ6mNTpfJo5/yFpx9oUpcMAdkFuJg6XrDdTsXPS2h7k
	GLvSbRcpTkpWIc5N4wDBW2/yI8K6Ty3PJ4nD3yQTsIBN4aKnhTQXgLS+zAOzvmVA
	e+24GA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrumygq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 06:00:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3692c5b061bso10292561eec.1
        for <ath12k@lists.infradead.org>; Sun, 25 Oct 2026 23:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792994437; x=1793599237; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HIFyJKOlRqsffaUB3MiFb99f+rh+OGZ3T7I07VYqgs=;
        b=YAUrF6mbNzzBMrZ49vTDbV6BjQ27PICVC4jf6+JGbfbQDnXFE1vkt8YMZ7KDCjVHad
         r61tCMVE7Ap8GbN02M3LG7JCD0VI4T1oltQrJyxFmBY6siBbXheSNi1kOIkIEzjZxjoP
         hxr0LDzwZJu1P9LXAptqvES1vwQABKgFVKiKa4VeFiaP7CSl3OcvDJz1Go7g8mXfUAfq
         +W55ORysslVpvnx5pwb+6AIW8T4oNfMasXQ3g5jZzLIow8tbT1rZd4cg7VXt2WmvInR1
         gxIxf2ky11pCAOlsA6nO4I9qWMHKZCIsRpGh2W+GPtUBgicy13TKdTFDnkhUXyasE/cv
         +5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994437; x=1793599237;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HIFyJKOlRqsffaUB3MiFb99f+rh+OGZ3T7I07VYqgs=;
        b=rAhOCXSJxer3JPJb7l8q8PCkzLZ6zt+JOvuAHjrmVVGT+fihSfKqGC45gQcDDDqL2S
         O5sXlWHcwtoHjLu9W7tx8sNcCmAb2wU1qkygMvV4XYVbRqzOXwtmVf8UkZeRETiG8LMU
         lEKFZPUgiJr5dE82ULa6zwCRLjJLYPG71RgYUWNPVl99L0Ki/jG1H2rGzrcJdm7tKU8k
         7tIEjbavEf3+24cP8hZEzAr3GvBp5KkEdhEEXJoqDPMyzIdMb+Vd8EhtraiwNrBOJyfz
         kzwF87Cw0c6eIVPzInvEaDF1SVbm7bZluuitVPTS16NyXrtNxlvQsOsB6QAd/PpoHFlZ
         Mx4A==
X-Forwarded-Encrypted: i=1; AKwUvBwQQyko6KrN6zueUJEqzusU2vdZ76i1PoGzdMbwyaa9iVlKY/4bFdGQaWRAxhmSuJCsq7mW4L4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJoy8QVexo05dL1dClIGMUVCDhmXWOvhCJ6cX4Yide8z5RCEdBE
	VW5lZr23cqZL9fVYZlW+EahfO8n4CZ4vSU+cxdahInw7+Jy3NKvRPrjQAs7gdrzOeHeq+ade2f1
	RbVkx55axUGHfFjF68qsb6BSdj5mPW0R63F/DZPQIIxjfOUIHV+g/+bU2PQ+I9BlDD+H5svdd
X-Gm-Gg: AYBFou1QpI/G/PHFrmpWV7b+viGrSorjbdoZCDVTi6kgwSQQQKk0dA57TFCJAkuR59O
	+Vi5FRw9W+U0h2QxhfrvJnMMFGFElnqLBpisuaC91MWiWqAgvwUTmMaMNJi9jlMx6w6TLVMmq2u
	H6I/dDpWyQD4at93N3FNIufD53uvxCz73wL7gjPqf03et/CyMiLKnOEH5op19A6jOzmK/Syoo0r
	EJ9zP6/zReVggg4/g+jks18br4TsQH5aqJ82VJYSyQSheizcNur3o8mJzFVlESmm85zxags2JXB
	rTdnn2InhMFv0eV4tWpgZeswbuz73UeUC68x2BCDuE6qT9/PhLnQHjYZUNrOETiLXuYE0fl3chX
	6+SUPR26DX9yh3GMa6cdcov0uXGzick+kmjee4rexIQHvL+0=
X-Received: by 2002:a05:7300:51f2:b0:366:3257:771c with SMTP id 5a478bee46e88-369e84ac697mr9820326eec.16.1792994437117;
        Sun, 25 Oct 2026 23:00:37 -0700 (PDT)
X-Received: by 2002:a05:7300:51f2:b0:366:3257:771c with SMTP id 5a478bee46e88-369e84ac697mr9820278eec.16.1792994436291;
        Sun, 25 Oct 2026 23:00:36 -0700 (PDT)
Received: from [10.152.221.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm26842570eec.24.2026.10.25.23.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:00:35 -0700 (PDT)
Message-ID: <48964cb4-bbc7-4115-89e5-23ec6766a845@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:30:32 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: use hal_rx_mon_status for PPDU
 parse result
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20261015-hal_rx_mon_status-v1-1-b32d5a7383fd@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261015-hal_rx_mon_status-v1-1-b32d5a7383fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMyBTYWx0ZWRfX0p42kLlBEeYQ
 KV8GnVbbZ/KX5MIwTmTGqCBuKw8IQsm49qI0s9lsAfptIaDOjaJcqTddFg2No6yi/qUdIkU74KA
 RbsfWSED9WWg8h4hJal1KR0nwuJLzIFJmLJckbqoQI8t5wJ+XNSzrRAPEJPArcDZb9iqH9cc69r
 QbkUPLZnO1jKuNlLgBxX+6Y5CBbFH7ewCAa+VmvLz1AJbTyoA8nmuslrMjZWpyXfT1HN8QMSHmR
 lTCQWWeefcP8kB5eeG1yvvIMmfBK0o0JgAbm/fsRcN7rwdUI4Vxg3ZmTZyKkF78pknw5+Ayme+N
 bSlrd7ESFJ34FnkV5Xn5+Zgme2f4qAu4kwUmydJPfc2hYDU38dHqea/VMgPskcVq6tApeu6Olfk
 bk/Fa9tmY0iBAimRmFd/nsCUK2Lkq8k/57EHM/YnR0A8yPizweL3xBeW7nuyGaoVVVMhSsPVaTl
 gIhgc+6Pz7gqmglsfHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMyBTYWx0ZWRfX/fsTPVYzTNO7
 F48Nx82L6FINEUhjkZSilONV8g2eFPKz9W2JpyWyLl0Z96aAeXCtsIrBtV2w98IkxseIHb8bXAi
 jEzllLFwZaza/rA1BGvFXpwUWXRTGk8=
X-Proofpoint-ORIG-GUID: OnqNvv2ggEjsv0BBlPpbjSW8_WEQPVuQ
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adeec86 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=g4tz2Ay1j4hv8wUIq6UA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: OnqNvv2ggEjsv0BBlPpbjSW8_WEQPVuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_230041_011387_89BD5CF4 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 16-10-2026 11:19, Kang Yang wrote:
> ath12k_wifi7_dp_mon_parse_rx_dest() returns enum
> hal_rx_mon_status, but one caller still checks the result against
> HAL_TLV_STATUS_PPDU_DONE.
> 
> Use HAL_RX_MON_STATUS_PPDU_DONE instead. This is a cleanup only
> since both values are identical.
> 
> Remove the now unused HAL_TLV_STATUS_* defines.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

