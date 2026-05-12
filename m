Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6A7CD4851
	for <ath12k@archiver.kernel.org>; Tue, 12 May 2026 14:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVIPrR0dky89V+VLYJhc151VZ75vhVXCOk5HK0StCLQ=; b=zdDaxp1j7h8ZwWMEWVTAo2IgBc
	ftSkcbuC4MtUe+ZGOJjW5uVAmhVI+eFck0+aM1Oj7FVpTn+zOpGFAw6Qpmfg1TaWUhWoN1/1hYiTu
	QCtVV31TLWr/q+R0iWr7LDp6Ma1La4LPchcL2NTlgCChJIcW57Sy6HF0q7oU1Op9akDtO+lyefN8n
	fqky0b5c3tHlAnX+oWajod7+yjgRgglfaOdjJSzZBJ/CR8G/uXlbTt8Per0K1iX55VZiuXz2812C5
	WkVV063Wc8IospsJ7iFtx6mmpcJtFSxSl79/QqTBpHq31aF+Um3RHx2zggr7eQyZ8vBBnoKkf2Eqy
	LYyM+CBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMo6S-0000000H27w-2LLR;
	Tue, 12 May 2026 14:28:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMo6Q-0000000H26N-1Rvt
	for ath12k@lists.infradead.org;
	Tue, 12 May 2026 14:28:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBkhGr866085
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 14:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BVIPrR0dky89V+VLYJhc15
	1VZ75vhVXCOk5HK0StCLQ=; b=UtpwTOfiZJjZXE6+Dqj0PcunZYS7Nt7qzPbzsC
	FA9jCcu1pE5sboc/6GQf+IIF3wtMVfNl3qXuMYreRQDwdmvLs8zxswZN9iqmMYDC
	IabEJ4RHKSWkxEg0zLfJ2bM8C3Y5131i9TP1lP4/EM1M+S76Kv8IC3HYY2YT/Lck
	ZXWbqKjTRCXoOkYRz+N6ZZYu0zvDbI9NZHZmQb4riT5dmyN2ET55TUXZ9gFNV23o
	t+iw1znWZEBYmBE5hVPvDZ9x6mBHm4nMNCnToeiyMh9ooG20UDW7RNr+eE7BQE6K
	6Ra3KnrQ38sTKzARYZqwVmspMw+F+6MsqV5J6w3UgobruGCg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2b74x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 14:28:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee34588671so7889054eec.0
        for <ath12k@lists.infradead.org>; Tue, 12 May 2026 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778596132; x=1779200932; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVIPrR0dky89V+VLYJhc151VZ75vhVXCOk5HK0StCLQ=;
        b=fOM6EIqY1H+UxkzVDOqldf2fxXjujj5FctOeodjoTaZgOAG4vpkoH2/roYEJmgAGd+
         TvkF3tw50BKhc7OPRVW7GsY1Vh2I/yBEL5JrefnnTTQ16OQFEMuEVEmc8+r1kKSgCo91
         Eo/19jhq63sXKTG1Duc8cethqKhNagBHKqOrsP6+UJHRsBLeLTV9JaFZLmwO/c+2dEdd
         eXlPoRYVpBqJWt9ZT+L6bSbQDVCRKrsSTUcse3OvgkEWqYstIW8jsI+Wm0mRrqKxj9/B
         QXEMND84IIpQdtWpVByJDT/TdP4iXKRLkyDfsGtF9Kt0ufgnFyeMC/4q0geecZus5U62
         9iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596132; x=1779200932;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVIPrR0dky89V+VLYJhc151VZ75vhVXCOk5HK0StCLQ=;
        b=JdKP1DnKIXVwONFI/f09Fwn0YqJvW4bhBtWdopGUIRCY3TqHZVyqhjMfET+xfw9oMU
         pJtBVGCeBgB4K1Lpvg4KExNC1BNABMoIz9PreU86KDzQ1xmqbm0565T85XavAgNuT/Gi
         su9C+KdQ6iJIQND+5jPB/sghRVYEFx8ItyhqmHGpVlZQafAxvAVnYp7f7P1hlK7AJDw0
         HtwyTRPojWx7T21p3xYzURpDt6Y1iNHXft8MtwqwKD/TyExMbAIh4tjqCOEb02KmcICX
         oeLapGi5r5sxiZwG2b1GosDIYCfJGv70C91wjdZ8KU3fHciLZ8irhSeyRXaJerwISQ2C
         IySA==
X-Forwarded-Encrypted: i=1; AFNElJ9oeLL+aeGf/6+yepJbihTk57hYQ6Q2m/eMymD+hwLrR+j2jFgQGhsqeo9aDtNgaaFPfzzDIrg=@lists.infradead.org
X-Gm-Message-State: AOJu0YytDiZ3X1EtAs+Sj5qpw0oVQDPZAMLAUGSb1RS3VoZSKRy9MDg8
	X0GB9tgmMwQroaDBDQKyZ83vym4zgisjDTjuIY08cBVXWPXvm22gur1FoUXTozzfO9pZAd2YNDs
	4GLbu2E8ySio7oCTQh8QLWr3X0YmRbPC7aL8kG5zcHYwUnhbNyqFzkeO77iLKBrZ5
X-Gm-Gg: Acq92OG2QEsQaPxwEwRoak8mG1q+ssu4YIKALwywDPKzoJ3hqL4sFIWxeMd5k9v/43m
	Pi9XelnaWDcyB0MZ66rx7BlIvc5jXTr7jBENlCNc2eIZe7k55JmD2eVOkTDkRq1b3H5FauEq6v5
	Zol+b9x8qjeexUrlL5cA7N4cODt/24pK/XkCPrYwkp+kyYU/c9bcL/uvYIubbCh2zjz4+yzxbQI
	q/vAlAb89chG7S9Rq/u/WnphmGYVtU2q9voAGUERiV1G5YhEc5p8bjEr7hpSlm9i5Hto3kp4h7B
	EtvTYyQpXGBPesJSBcC6u0qBtx+t498HeuNNvN/5ObRBCXjUsFIyzNWs7BWAifcWd4aI1+qODgY
	1a1XbSOwNigPPJd9sIFhKF3sCyb9KOweimQGGegRflxpvQ9c9lAoJjChNNg==
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr1711479eec.13.1778596132191;
        Tue, 12 May 2026 07:28:52 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr1711447eec.13.1778596131568;
        Tue, 12 May 2026 07:28:51 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8884752a9sm17776009eec.16.2026.05.12.07.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 07:28:51 -0700 (PDT)
Message-ID: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
Date: Tue, 12 May 2026 07:28:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260512
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2dNIhEyGXMzUDcOk9nb5h6CLGldLFj9w
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a033925 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=HDnrh3WxrgwM_mXiSj8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 2dNIhEyGXMzUDcOk9nb5h6CLGldLFj9w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1MSBTYWx0ZWRfX/sjmESOwZYyO
 NDxwcbZTq61UnQ6Ho5xDOH9U6YDLQro5n2WCnLcJWXbujRd9pBjQirpJ72JHHt9TumycMSK/Kqt
 VLNt3shtkq6qfEYPbPxyRpvaEwGSShSfJTPZpOioYfD/P1bsoKWyoMyT50/yXfyDnRsamuQkhvG
 D1BYxgexrbNLpOw81WcuZEPuu7ZwNLSmE3vHMZURKBqAFWV5nRXHj+SEaQnfLLAzirfXQQ7vdg8
 IZ0OFHYKh7abQlaHiZNs+i6uF8IDLOPXUhyxH8HKsYKFwvT5vA3sv/I6ba+75kGL4F5FBH9ydJe
 91qb6oml2Mh6PBzPJYSNCOnXG42yoRt/gXPaCdI94L9HwhIH9HXy1NCn/9VO72oC/XIU/U23vmK
 JBqfNTqQ8YeCZKiIdw4bcohCipjtPebQQOxKiT0ufnhO/SHzJR64tNCH32iOP+P/m8xFRc34ERo
 AFaBHMml0CMRCfCXiow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_072854_492623_BFEB9D81 
X-CRM114-Status: UNSURE (   7.24  )
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

The following changes since commit 7666dbb1bacc4ba522b96740cba7283d243d16e1:

  wifi: cfg80211: advance loop vars in cfg80211_merge_profile() (2026-05-08 09:20:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260512

for you to fetch changes up to 54a5b38e4396530e5b2f12b54d3844e860ab6784:

  wifi: ath10k: skip WMI and beacon transmission when device is wedged (2026-05-12 07:00:00 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc5

In ath10k, avoid sending any commands to firmware when it is wedged.
In ath11k, fix WMI buffer leaks on error conditions.

----------------------------------------------------------------
Kang Yang (1):
      wifi: ath10k: skip WMI and beacon transmission when device is wedged

Nicolas Escande (3):
      wifi: ath11k: fix error path leaks in some WMI WOW calls
      wifi: ath11k: fix error path leaks in some WMI calls
      wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()

 drivers/net/wireless/ath/ath10k/wmi.c      |  15 ++--
 drivers/net/wireless/ath/ath11k/testmode.c |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++++++++-----
 3 files changed, 120 insertions(+), 27 deletions(-)

