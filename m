Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D715CC43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUsK7bpTixn+YbKeaafKtp2BKCKuSVgAGS2fazklOqA=; b=slvHU8xqiuN3IiGubamwwldcGm
	p+OD6sSOQhFi6/QjoQmzbenS17/xVt3p/ojYy/n59Za+IGZih3ppjEexsQvD7g4fnu8lFQZADWwhd
	vjRhb0zJBqxQCePZOYc3pLujpuFnOM/VlI1ylzte1XUoZUPs8TJajJIORjQoO32uJ3P35CpHenZYc
	ggV8CXJ9MPC4Wlt6333K/8pZMEWD+iU7CLjN+fdLI+F2Pwd0UjsTwUBHMtTKnFi45cqHZG2+LKajB
	DUK/c51ZCaai57vnSfnKTPeuRPuof5DO2ZLHXDfr7jo+6LQt25hGtQJK++JPKAlNKRaKq2OSTk1Lm
	dCv4Umig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Mf-0000000Dsom-2LFu;
	Mon, 29 Jun 2026 07:25:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Mc-0000000DsoN-3Vlp
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 07:25:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72l0w2164230
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUsK7bpTixn+YbKeaafKtp2BKCKuSVgAGS2fazklOqA=; b=RYRY6JaaA7uQFR+H
	14qxXVbyWvc0MSgVSVUXT699fC1OAZDEK39NeGeR2VuKO4EASn0oSTzjTF26byLO
	kL1Sk79Etuzg0VZ1s45MiVKQDk5w0PeM0GYMz9rSE6blM9om3pr+HKzgzGTSUYZc
	g6DoLNApixgsWVCAk9I19dAU0WVjb7gpJx7U09PvftiHt4yy6U2/TdgCx9D4IKdk
	4mWIzagYj9HDDXK0D0ouhji6GC0wi+lOIG9KB6LtzHWGjTJomBWb5DKH5p98nDVN
	YZpBFqs8P8BmEsStA9grStK+GM5odnfXXrk1KEL2ZXCycITdjX4wSvVojWLabMt5
	jtQTeA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjg37y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:25:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso1498088a12.0
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782717905; x=1783322705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUsK7bpTixn+YbKeaafKtp2BKCKuSVgAGS2fazklOqA=;
        b=Am8X92BdOOig4QcmYw2qa9Df85pmyID5ufX7cbt8E4llqUrvFMlhBqJ8c22e8EgEz9
         m8uSAalg8NM98ZGJcBieMU/QjdNRm/T8bQQ3d6ao76eIniIJ50z7w7oNC8iWyev07tKE
         JKRCNuW7Sl2In08Vn2GNXnWVJXCtKybaVZWp6vplYqf5GUU/Yu6GhyURDl/j2nWommTx
         papL1B9ntPXHTIhiB7b5+bi2l4gLEqlY3bdIOc358S1oLeU/93PQnP8Q3+astlpko2U9
         jMmnMv1YnJrAyELyyb6Mh3C2+g04cjFEu4hqa2J3thFoD/WpbYs0moO/5wFCKpjUsfTf
         YPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717905; x=1783322705;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUsK7bpTixn+YbKeaafKtp2BKCKuSVgAGS2fazklOqA=;
        b=RJfIwDdfTbGIf0kt7J5R2TlRwo53d9JSSVl+KZZQ8ZdRe3QMx34Ksnw1MIOQG6PLFc
         dcGcOMwUZvM/Kt2nqBmGNze5FZ6dy7yZbNo9bxiGdkonE9iANjNTv9d4hcxOvPyC+Q/Z
         cAZv1DbiKJ9BQCX8G/XADLfqUeHOOJhvea/uAKVr1PzHBCdWzQ4M+hQXSpb1zjwhCRQJ
         c6OrD3jMm7KSW2+M7pTM+tnivmso5/PzJ03hbqAALI0+fwcFiruiYnCH0qiLq2pI4tiB
         2dQNH8Q5IHHj82Zf0w4hHd5K07cfxR4FD5cZYI3BSOKkpti6KI+wg9wjCPuwlUdWdUF+
         vaZA==
X-Forwarded-Encrypted: i=1; AFNElJ8yXdNp/OBXnOcNBmWrHpm8PDQQ9m8XBu7VueB9XYro2lBIW4soMvEd1vGMp/sJyGhoD6rIgg0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEMuPEguiZr7p27Qb6dPIV0m7v83wnDM5HhTSix+Wwj2oSctFp
	jKnTGezVDFsfevRq5U33c+4N25gPgYROy15N9EtgxPPrtH2XXD2Ep9Wu9J4QN/wA+9wVarXuXI/
	mHPH+01YJR/+oPaRwGI2BfaSOPt8oy/bVikUo92vqfQMiUjMFVmAA8LWmNL5m3sW0
X-Gm-Gg: AfdE7cllendZbS3i6OS9RCgIPYElbjN2hjvl/2R6SQOhMrgpqebMyWcSAPx0uxmSLZX
	sIuMLeV26iVTZKui09TAsqFyOk4pp3EBaMafvPAcAXaKIFXK2DJQ9XsfnynPS/A+pgacvEOHecN
	qt8of66rMncLYWN0nSgo9vC61qMB2Lrc+TnODeSQ0pzo+IHUKaWENOaJeSdHMzvgK7F1bc0qBdt
	yezs0ckYFA5UUSGU1X90PtHEtIizrdmRNsHLMaA2AuHWFpAvNROmNjrhdNdbsiHynVYvtp9+2Lg
	NiJdXCNrMgT/IPYGocKPtxYFuLcyIIE11ggX+3sVzJ+VW+da06kN9A44hSDgrVqCOKVARy49f2R
	K7ivzjR5POQ7zjnvm/EN6koBCFok6MMLWwWh4cCQ9IxzfpVLdVPS75Jq4Cms25WxoA2J4lQuQcC
	RhVVIyOQ==
X-Received: by 2002:a05:6a20:4321:b0:3b4:71a9:cd8f with SMTP id adf61e73a8af0-3bd4b2b611dmr14094226637.41.1782717904936;
        Mon, 29 Jun 2026 00:25:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:4321:b0:3b4:71a9:cd8f with SMTP id adf61e73a8af0-3bd4b2b611dmr14094205637.41.1782717904529;
        Mon, 29 Jun 2026 00:25:04 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0eadsm7221679a12.20.2026.06.29.00.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:25:04 -0700 (PDT)
Message-ID: <b68d4aa6-b4ba-49b6-91b7-ff8c4dceb11f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:25:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/3] wifi: ath12k: Improve dp stats
To: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FAEfph6VvwAU9PCGMrnWJNlDIbch_FlR
X-Proofpoint-ORIG-GUID: FAEfph6VvwAU9PCGMrnWJNlDIbch_FlR
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a421dd1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=w1hz04t2yJB1brSwPtAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX8dYlhoB0hpCI
 bcm2N3TvQoM0XxgaBzByxZXaJG9kkJ+K5UKyODjXL6uBLqDap57MrqBPwbLchedhqJJ6o8sgmxd
 uvMJDxq0aM33JOm6ruauazu6C/KrxLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX3f/tbnk8x0YJ
 ezKvhhbYqeJI3Ox+qoRHHknvVaXKMztH8HrSGfMMg16mtDbCglVmFRvTAfyICaQmf1EAqi+15jb
 SrTD5aqmuOayUa+CpWTBJebVdXz1+edMMDTNHAy7MX++U6wmTDlgqJcJK5k0hHtmsYkrTXqqWvX
 ViwM6dGorVNddcsd6TgAANulZD2vJqnar50lZHaSEUIRRDlzK/NPBXQdN1Bg2esRw+SRZ2uWHiR
 jSt2CO3njhjerPSjHSd7ocJ+VPNyObAtMOCGexltLa0YFva5Pzad8HRdVHEYwhbZUF8dFRGQyqj
 pO8j7kbWQyNY2ivTGvu+0FGjw+mKs0mzgFyOZvLXyOQUqmi20JcomZAx1qv3gxj7RLOP7JTb+W1
 AFqV2pbeVyTGRRhi1aoJVqqoe99L6AHzKJyx7THu1ncswyo1wsTNfZwY3pMeVj1v9Y/oJeEpQCB
 1GwOECWZ8nvjCB+3GsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_002507_000007_80BAB103 
X-CRM114-Status: GOOD (  16.06  )
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



On 6/26/2026 4:52 PM, Sreeramya Soratkal wrote:
> This short series improves the device_dp_stats debugfs interface in
> ath12k to produce more useful and accurate diagnostic output in MLO
> configurations.
> 
> Patch 1 fixes a latent correctness issue where the REO Rx and WBM
> release error tables were unconditionally printed for
> ATH12K_MAX_DEVICES columns showing zero-filled entries for device
> slots that have no hardware. Replacing the compile-time constant
> with the runtime device count keeps the output compact and correct.
> 
> Patch 2 prepends a ktime-based millisecond timestamp to the top of
> the dump. In MLO setups the per-device file is to be read
> independently for each ath12k instance, so without a common timestamp
> it is difficult to verify whether two snapshots are contemporaneous,
> making cross-device counter comparisons unreliable.
> 
> Patch 3 extends the existing per-radio section to report the center
> frequency on which each radio is currently operating.  This allows
> the reader to correlate throughput and error counters with the channel
> without having to cross-reference iw/nl80211 output separately.
> 
> ---
> Changes in v2:
> - Rebased the patch series on the latest tip of ath-next
> ---
> 
> Sreeramya Soratkal (3):
>   wifi: ath12k: Use runtime device count in dp stats display
>   wifi: ath12k: Add timestamp to dp stats display
>   wifi: ath12k: Show per-radio center freq in dp stats
> 
>  drivers/net/wireless/ath/ath12k/debugfs.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


